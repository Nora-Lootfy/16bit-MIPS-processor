`timescale 1ns/1ps

module pc_tb;
	
	wire 	[15:0] 	pc_out;
	reg 	[15:0] 	pc_in;
	reg clk, rst;
	
	
	
	pc 	pc1(.pc_out(pc_out), 	.pc_in(pc_in), 	.clk(clk), 	.rst(rst));
	
	
	initial	begin 
		
		pc_in 	= 	16'b0000000000000000;
		clk = 	1'b0;
		rst = 	1'b0;
		
		#20
		
		rst = 	1'b1;
		
		
		forever	#40 pc_in = pc_in + 16'b1;
		
	end	
	
	always #20 clk = ~clk;
		
endmodule