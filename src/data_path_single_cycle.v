`timescale 1ns/1ps

module data_path_single_cycle;
	
	reg 	clk, clk_4, clk_5;
	reg 	[15:0]	pc_next, pc_temp;
	wire 	[15:0]	instruction, pc_current;
	// ================================================================================================
	reg		[2:0] 	opcode, rs, rt, rd;
	reg		[3:0] 	function_extend;
	reg		[6:0] 	i_label;
	reg		[12:0] 	j_label;
	// ================================================================================================
	wire	[1:0] 	PC_sel, MemToReg, REG_sel;
	wire	[3:0] 	ALU_OP;
	wire	write_EN, HLT_RST, MEM_write, MEM_read, ALU_sel;
	// ================================================================================================
	reg 	[15:0]	reg_write_data;
	reg		[2:0]	reg_write_add, reg1_read_add, reg2_read_add;
	wire  	[15:0]	reg1_read_data,	reg2_read_data;
	// ================================================================================================
	wire 	[15:0]	i_extended;
	reg		[15:0]	ALU_input_1, ALU_input_2;
	wire	zero_flag;
	wire	[15:0]	ALU_out;
	wire	[15:0]	data_memory_read;
	// ================================================================================================
	
	
	// section 1 getting instructions from memory
	initial begin
		pc_next 	= 16'b0;
		pc_temp 	= 16'b0;
		clk 		= 1'b0;
		
		forever #20 clk = ~clk;
	end
	
	initial	begin
		clk_4 		= 1'b0;
		#4
		forever #20 clk_4 = ~clk_4;	
	end
	
	initial	begin
		clk_5 		= 1'b0;
		#5
		forever #20 clk_5 = ~clk_5;	
	end
	
	pc 					current_pc(.pc_out(pc_current), .pc_in(pc_next), .clk(clk), .rst(rst));	
	instruction_memory	InsMem(instruction, pc_current);
	// ================================================================================================
	
	
	// section 2 split instruction
	always @ (posedge clk) begin
		#1
		opcode 			<= instruction[15:13];
		rs				<= instruction[12:10];
		rt				<= instruction[9:7];
		rd				<= instruction[6:4];
		i_label			<= instruction[6:0];
		j_label			<= instruction[12:0];
		function_extend	<= instruction[3:0];
	end
	// ================================================================================================
	
	
	// section 3 getting control signal
	control_unit_single_cycle	CU(
		.PC_sel(PC_sel), .MemToReg(MemToReg), .REG_sel(REG_sel), 
		.ALU_OP(ALU_OP), .write_EN(write_EN), .HLT_RST(HLT_RST), 
		.MEM_write(MEM_write), .MEM_read(MEM_read), .ALU_sel(ALU_sel),
		
		.opcode(opcode), .function_extend(function_extend), .zero_flag(zero_flag)
	);
	// ================================================================================================
	
	
	// section 4 register select handling
	always @(posedge clk) begin
		#2
		if(REG_sel == 2'b00)
			reg_write_add = rt;
		else if (REG_sel == 2'b01)
			reg_write_add = rd;
		else
			reg_write_add = 3'b111;
		
		reg1_read_add <= rs;
		reg2_read_add <= rt;
			
	end
	// ================================================================================================
	
	
	// section 5 register file handling
	register_file 	RF(
		clk_5, HLT_RST, write_EN, 
		reg_write_add, reg_write_data,
		reg1_read_add, reg1_read_data,
		reg2_read_add, reg2_read_data
	);
	// ================================================================================================
	
	
	// section 6 sign extend handling
	extension_unit 	EU(
		.out(i_extended), 
		.in(i_label)
	);
	// ================================================================================================
	
	
	// section 7 ALU input handling
	always @(posedge clk) begin
		#3
		if(ALU_sel == 1'b0)
			ALU_input_2 = reg2_read_data;
		else
			ALU_input_2 = i_extended;
		
		ALU_input_1 <= reg1_read_data;			
	end
	// ================================================================================================
	
	
	// section 8 ALU handling 
	ALU alu(
		.A(ALU_input_1), .B(ALU_input_2), 
		.ALU_opt(ALU_OP), .zero_flag(zero_flag), 
		.ALU_out(ALU_out)
	);
	// ================================================================================================
	
	
	// section 9 data memeory handling
	data_memory	DM
	(
		.clk(clk_4), .address(ALU_out),
		.data_write(reg2_read_data), .mem_write(MEM_write),
		.data_read(data_memory_read), .mem_read(MEM_read)
	);
	// ================================================================================================
	
	
	// section 10 memeory to register select handling
	always @(*) begin 
		if(MemToReg == 2'b00)
			reg_write_data = ALU_out;
		else if (MemToReg == 2'b01)
			reg_write_data = data_memory_read;
		else
			reg_write_data = pc_current;
	end
	// ================================================================================================
	
	
	// section 11 pc select handling
	always @(posedge clk) #1 pc_temp = pc_next + 2;
	
	always @(posedge clk) begin
		#4
		if(PC_sel == 2'b00)
			pc_next = pc_temp;
		else if (PC_sel == 2'b01)
			pc_next = reg1_read_data;
		else if (PC_sel == 2'b10) 
			pc_next = {i_extended[14:0], 1'b0} + pc_temp; 	
		else if (PC_sel == 2'b11)
			pc_next = {pc_temp[15:14], j_label, 1'b0};
		else
			pc_next = 16'bx;
	end
		
endmodule