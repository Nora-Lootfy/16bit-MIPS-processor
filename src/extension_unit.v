module extension_unit(out, in);
	input 	wire	[6:0] 	in;
	output	wire		[15:0]	out;
	
	assign out = (in[6] == 1'b1)? {9'b111111111, in} : {9'b0, in} ;
	
endmodule