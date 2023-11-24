`timescale 1ns/1ps

module d_flip_flop_tb;
	
	reg in, clk, rst;
	wire 	out;
	
	
	
	d_flip_flop 	dff(.out(out), 	.in(in), 	.clk(clk), 	.rst(rst));
	
	
	initial	begin 
		
		in 	= 	1'b0;
		clk = 	1'b0;
		rst = 	1'b0;
		
		#20
		
		rst = 	1'b1;
		
		#20
		
		forever	#40 in = ~in;
		
	end	
	
	always #20 clk = ~clk;
		
endmodule