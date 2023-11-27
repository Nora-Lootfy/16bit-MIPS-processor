`timescale 1ns/1ps

module data_path_single_cycle;
	
	reg 	clk, rst;
	reg 	[15:0]	pc_next;
	wire 	[15:0]	instruction, pc_current; 
		
	pc 					current_pc(.pc_out(pc_current), .pc_in(pc_next), .clk(clk), .rst(rst));	
	instruction_memory	InsMem(instruction, pc_current);
	
	initial begin
		pc_next 	= 16'b0;
		clk 		= 1'b0;
		rst			= 1'b1;
	end
	
	always @(posedge clk) pc_next <= pc_next + 16'b0010; 
	always #40 clk = ~clk;
		
endmodule
	
	
	
	
	
	
	
	
	