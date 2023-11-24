module d_flip_flop(out, 	in, 	clk, 	rst);

	output 	reg 	out;
	
	input 	wire 	in;
	input	wire	rst;
	input 	wire 	clk;

	
	always @(posedge clk or negedge rst)begin
		if (~rst) 
			out <= 0;
		else 
			out <= in;
	end
	

endmodule			