module pc(pc_out, 	pc_in, 	clk, 	rst);
	
	input 	wire 	clk;
	input	wire 	rst;
	
	input 	wire	[15:0] 	pc_in;
	output 	wire	[15:0]	pc_out;


	d_flip_flop 	dff0(pc_out[0]	,pc_in[0],	clk,	rst);
	d_flip_flop 	dff1(pc_out[1]	,pc_in[1],	clk, 	rst);
	d_flip_flop 	dff2(pc_out[2]	,pc_in[2],	clk, 	rst);
	d_flip_flop 	dff3(pc_out[3]	,pc_in[3],	clk, 	rst);
	d_flip_flop 	dff4(pc_out[4]	,pc_in[4],	clk, 	rst);
	d_flip_flop 	dff5(pc_out[5]	,pc_in[5],	clk, 	rst);
	d_flip_flop 	dff6(pc_out[6]	,pc_in[6],	clk, 	rst);
	d_flip_flop 	dff7(pc_out[7]	,pc_in[7],	clk, 	rst);
	d_flip_flop 	dff8(pc_out[8]	,pc_in[8],	clk, 	rst);
	d_flip_flop 	dff9(pc_out[9]	,pc_in[9],	clk, 	rst);
	d_flip_flop 	dff10(pc_out[10],pc_in[10],	clk, 	rst);
	d_flip_flop 	dff11(pc_out[11],pc_in[11],	clk, 	rst);
	d_flip_flop 	dff12(pc_out[12],pc_in[12],	clk, 	rst);
	d_flip_flop 	dff13(pc_out[13],pc_in[13],	clk, 	rst);
	d_flip_flop 	dff14(pc_out[14],pc_in[14],	clk, 	rst);
	d_flip_flop 	dff15(pc_out[15],pc_in[15],	clk, 	rst);

endmodule