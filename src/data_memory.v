module data_memory
(
	input	wire 	clk,
	
	// memory access address
	input	wire	[15:0]	address,
	
	// handling write data to memory
	input	wire	[15:0]	data_write,
	input	wire	mem_write,
	
	// handling read data to memory
	output	wire	[15:0]	data_read,
	input	wire	mem_read
	
);

	integer i;
	reg [15:0] ram [32_767:0];
	wire [15:0] ram_add = address[15:1];
	
	
	initial begin 
		for(i=0; i<32_768; i=i+1)
			ram[i] = 16'b0;
	end
	
	initial	begin
		#1
		ram[0] = 16'd10;
		ram[1] = 16'd1;
		
		ram[2] = 16'd1;
		ram[3] = 16'd5;
		ram[4] = 16'd1;
		
		ram[5] = 16'd11;
		ram[6] = 16'd25;
		ram[7] = 16'd5;
		ram[8] = 16'd17;
		ram[9] = 16'd133;
	end
	
	always @(posedge clk) begin
		if(mem_write)
			ram[ram_add] <= data_write;
	end
	
	assign data_read = (mem_read)? ram[ram_add]:16'b0; 
	
												 															  					
endmodule