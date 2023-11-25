`timescale 1ns/1ps

module extension_unit_tb;
	
	reg 	[6:0]	in;
	wire 	[15:0]	out;
	
	extension_unit 	EU(out, in);
	
	initial	begin
		in = 7'b0;
		#40
		
		in = 7'b1111111;
		#40
		
		in = 7'b1000000;
		#40
		
		in = 7'b0111111;
		
		
	end
		
endmodule