`timescale 1ns/1ps

module ALU_tb; 
	reg 	[15:0] A, B; 
	reg		[3:0] ALU_opt;
	
	wire	zero_flag;
	wire	[15:0] ALU_out;
	
	
	ALU ALU1(A, B, ALU_opt, zero_flag, ALU_out);
	
	
	initial begin 
		A 		= 16'd10;
		B		= 16'd7;
		ALU_opt	= 4'd0;
		#40
		
		A 		= 16'd10;
		B		= 16'd7;
		ALU_opt	= 4'd1;
		#40
		
		A 		= 16'd4;
		B		= 16'd2;
		ALU_opt	= 4'd2;
		#40
		
		A 		= 16'd4;
		B		= 16'd2;
		ALU_opt	= 4'd3;
		#40
		
		A 		= 16'd1;
		B		= 16'd0;
		ALU_opt	= 4'd4;
		#40
		
		A 		= 16'd1;
		B		= 16'd0;
		ALU_opt	= 4'd5;
		#40
		
		A 		= 16'd1;
		B		= 16'd0;
		ALU_opt	= 4'd6;
		#40
		
		A 		= 16'd10;
		B		= 16'd5;
		ALU_opt	= 4'd7;
		#40
		
		A 		= 16'd10;
		B		= 16'd5;
		ALU_opt	= 4'd8;
		#40
		
		A 		= 16'd10;
		B		= 16'd5;
		ALU_opt	= 4'd9;
		#40
		
		A 		= 16'd5;
		B		= 16'd0;
		ALU_opt	= 4'd10;
		#40
		
		A 		= 16'd10;
		B		= 16'd0;
		ALU_opt	= 4'd11;
		#40
		
		A 		= 16'd10;
		B		= 16'd11;
		ALU_opt	= 4'd12;
		#40
		
		A 		= 16'd11;
		B		= 16'd11;
		ALU_opt	= 4'd12;
	end

endmodule