module control_unit_single_cycle(PC_sel, MemToReg, REG_sel, ALU_OP, write_EN, HLT_RST, MEM_write, MEM_read, ALU_sel, opcode, function_extend, zero_flag);
	input wire 	[2:0] opcode;
	input wire	[3:0] function_extend;
	input wire 	zero_flag;
	
	output reg [1:0] PC_sel, MemToReg, REG_sel;
	output reg [3:0] ALU_OP;
	output reg	write_EN, HLT_RST, MEM_write, MEM_read, ALU_sel;
	
	initial	begin 
		HLT_RST = 1;
		#1
		HLT_RST = 0;
		#1
		HLT_RST = 1;
	end
	
	always @(*) begin
		if(opcode == 3'b000) begin	
			case(function_extend)
				4'h0: begin //addition	
					REG_sel 	= 2'b01;
					write_EN	= 1'b1;
					HLT_RST 	= 1'b1;
					ALU_sel		= 1'b0;
					ALU_OP		= 4'h0;
					MEM_read	= 1'b0;
					MEM_write	= 1'b0;
					MemToReg	= 2'b00;
					PC_sel		= 2'b00;		
				end
				4'h1: begin //subtraction	
					REG_sel 	= 2'b01;
					write_EN	= 1'b1;
					HLT_RST 	= 1'b1;
					ALU_sel		= 1'b0;
					ALU_OP		= 4'h1;
					MEM_read	= 1'b0;
					MEM_write	= 1'b0;
					MemToReg	= 2'b00;
					PC_sel		= 2'b00;
				end
				4'h2: begin //multiplication
					REG_sel 	= 2'b01;
					write_EN	= 1'b1;
					HLT_RST 	= 1'b1;
					ALU_sel		= 1'b0;
					ALU_OP		= 4'h2;
					MEM_read	= 1'b0;
					MEM_write	= 1'b0;
					MemToReg	= 2'b00;
					PC_sel		= 2'b00;
				end
				4'h3: begin //division
					REG_sel 	= 2'b01;
					write_EN	= 1'b1;
					HLT_RST 	= 1'b1;
					ALU_sel		= 1'b0;
					ALU_OP		= 4'h3;
					MEM_read	= 1'b0;
					MEM_write	= 1'b0;
					MemToReg	= 2'b00;
					PC_sel		= 2'b00;
				end
				4'h4: begin //logical and
					REG_sel 	= 2'b01;
					write_EN	= 1'b1;
					HLT_RST 	= 1'b1;
					ALU_sel		= 1'b0;
					ALU_OP		= 4'h4;
					MEM_read	= 1'b0;
					MEM_write	= 1'b0;
					MemToReg	= 2'b00;
					PC_sel		= 2'b00;
				end
				4'h5: begin //logical or
					REG_sel 	= 2'b01;
					write_EN	= 1'b1;
					HLT_RST 	= 1'b1;
					ALU_sel		= 1'b0;
					ALU_OP		= 4'h5;
					MEM_read	= 1'b0;
					MEM_write	= 1'b0;
					MemToReg	= 2'b00;
					PC_sel		= 2'b00;
				end
				4'h6: begin //logical not
					REG_sel 	= 2'b01;
					write_EN	= 1'b1;
					HLT_RST 	= 1'b1;
					ALU_sel		= 1'b0;
					ALU_OP		= 4'h6;
					MEM_read	= 1'b0;
					MEM_write	= 1'b0;
					MemToReg	= 2'b00;
					PC_sel		= 2'b00;
				end
				4'h7: begin //bitwise and
					REG_sel 	= 2'b01;
					write_EN	= 1'b1;
					HLT_RST 	= 1'b1;
					ALU_sel		= 1'b0;
					ALU_OP		= 4'h7;
					MEM_read	= 1'b0;
					MEM_write	= 1'b0;
					MemToReg	= 2'b00;
					PC_sel		= 2'b00;
				end
				4'h8: begin //bitwise or
					REG_sel 	= 2'b01;
					write_EN	= 1'b1;
					HLT_RST 	= 1'b1;
					ALU_sel		= 1'b0;
					ALU_OP		= 4'h8;
					MEM_read	= 1'b0;
					MEM_write	= 1'b0;
					MemToReg	= 2'b00;
					PC_sel		= 2'b00;
				end
				4'h9: begin //bitwise complement
					REG_sel 	= 2'b01;
					write_EN	= 1'b1;
					HLT_RST 	= 1'b1;
					ALU_sel		= 1'b0;
					ALU_OP		= 4'h9;
					MEM_read	= 1'b0;
					MEM_write	= 1'b0;
					MemToReg	= 2'b00;
					PC_sel		= 2'b00;
				end
				4'hA: begin //logical left shift
					REG_sel 	= 2'b01;
					write_EN	= 1'b1;
					HLT_RST 	= 1'b1;
					ALU_sel		= 1'b0;
					ALU_OP		= 4'hA;
					MEM_read	= 1'b0;
					MEM_write	= 1'b0;
					MemToReg	= 2'b00;
					PC_sel		= 2'b00;
				end
				4'hB: begin //logical right shift
					REG_sel 	= 2'b01;
					write_EN	= 1'b1;
					HLT_RST 	= 1'b1;
					ALU_sel		= 1'b0;
					ALU_OP		= 4'hB;
					MEM_read	= 1'b0;
					MEM_write	= 1'b0;
					MemToReg	= 2'b00;
					PC_sel		= 2'b00;
				end
				4'hC: begin //set less than
					REG_sel 	= 2'b01;
					write_EN	= 1'b1;
					HLT_RST 	= 1'b1;
					ALU_sel		= 1'b0;
					ALU_OP		= 4'hC;
					MEM_read	= 1'b0;
					MEM_write	= 1'b0;
					MemToReg	= 2'b00;
					PC_sel		= 2'b00;
				end
				4'hD: begin //jump register
					REG_sel 	= 2'bxx;
					write_EN	= 1'b0;
					HLT_RST 	= 1'b1;
					ALU_sel		= 1'bx;
					ALU_OP		= 4'hx;
					MEM_read	= 1'b0;
					MEM_write	= 1'b0;
					MemToReg	= 2'bxx;
					PC_sel		= 2'b01;
				end
			endcase
		end	
		else begin
			case(opcode)
				3'b001: begin //load
					REG_sel 	= 2'b00;
					write_EN	= 1'b1;
					HLT_RST 	= 1'b1;
					ALU_sel		= 1'b1;
					ALU_OP		= 4'h0;
					MEM_read	= 1'b1;
					MEM_write	= 1'b0;
					MemToReg	= 2'b01;
					PC_sel		= 2'b00;
				end	
				3'b010: begin //store
					REG_sel 	= 2'bxx;
					write_EN	= 1'b0;
					HLT_RST 	= 1'b1;
					ALU_sel		= 1'b1;
					ALU_OP		= 4'h0;
					MEM_read	= 1'b0;
					MEM_write	= 1'b1;
					MemToReg	= 2'bxx;
					PC_sel		= 2'b00;
				end
				3'b011: begin //branch if equal
					REG_sel 	= 2'bxx;
					write_EN	= 1'b0;
					HLT_RST 	= 1'b1;
					ALU_sel		= 1'b0;
					ALU_OP		= 4'h1;
					MEM_read	= 1'b0;
					MEM_write	= 1'b0;
					MemToReg	= 2'bxx;
					PC_sel		= (zero_flag)? 2'b10:2'b00;
				end
				3'b100: begin //branch if not equal
					REG_sel 	= 2'bxx;
					write_EN	= 1'b0;
					HLT_RST 	= 1'b1;
					ALU_sel		= 1'b0;
					ALU_OP		= 4'h1;
					MEM_read	= 1'b0;
					MEM_write	= 1'b0;
					MemToReg	= 2'bxx;
					PC_sel		= (~zero_flag)? 2'b10:2'b00;
				end
				3'b101: begin //jump
					REG_sel 	= 2'bxx;
					write_EN	= 1'b0;
					HLT_RST 	= 1'b1;
					ALU_sel		= 1'bx;
					ALU_OP		= 4'hx;
					MEM_read	= 1'b0;
					MEM_write	= 1'b0;
					MemToReg	= 2'bxx;
					PC_sel		= 2'b11;
				end
				3'b110: begin //jump and link
					REG_sel 	= 2'b10;
					write_EN	= 1'b0;
					HLT_RST 	= 1'b1;
					ALU_sel		= 1'bx;
					ALU_OP		= 4'hx;
					MEM_read	= 1'b0;
					MEM_write	= 1'b0;
					MemToReg	= 2'b10;
					PC_sel		= 2'b11;
				end
				3'b111: begin //halt
					REG_sel 	= 2'bxx;
					write_EN	= 1'b0;
					HLT_RST 	= 1'b0;
					ALU_sel		= 1'bx;
					ALU_OP		= 4'hx;
					MEM_read	= 1'b0;
					MEM_write	= 1'b0;
					MemToReg	= 2'bxx;
					PC_sel		= 2'bxx;
				end
			endcase
		end
	end
	
endmodule