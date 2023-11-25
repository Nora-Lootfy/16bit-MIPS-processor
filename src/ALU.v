module ALU
( 
	input 	wire 	[15:0] A,
	input 	wire	[15:0] B, 
	input	wire	[3:0] ALU_opt,
	
	output	wire		zero_flag,
	output	reg		[15:0] ALU_out
);

	always @(*) begin
		case(ALU_opt)
			4'b0000:	ALU_out = A + B;				// add
			4'b0001:	ALU_out = A - B;				// sub
			4'b0010:	ALU_out = A * B;				// multiply
			4'b0011:	ALU_out = A / B;				// div
			4'b0100:	ALU_out = A && B;				// logical and
			4'b0101:	ALU_out = A || B;				// logical or
			4'b0110:	ALU_out = !A;					// logical not
			4'b0111:	ALU_out = A & B;				// bitwise and
			4'b1000:	ALU_out = A | B;				// bitwise or
			4'b1001:	ALU_out = ~A;					// bitwise complement
			4'b1010:	ALU_out = A << 1'b1;			// logical left shift by one 
			4'b1011:	ALU_out = A >> 1'b1;			// logical right shift by one
			4'b1100:	ALU_out = (A < B)? 1'b1: 1'b0;	// set less than
			default:	ALU_out = 16'b0;
		endcase	
	end
	
	assign zero_flag = (ALU_out == 16'b0)?  1'b1: 1'b0;
	
endmodule
	