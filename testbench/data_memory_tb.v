`timescale 1ns/1ps

module data_memory_tb;
	
	reg clk, mem_write, mem_read;
	reg 	[15:0]	address, data_write;
	
	wire  	[15:0]	data_read;
	
	data_memory	DM
	(
		clk, address,
		data_write, mem_write,
		data_read, mem_read
	);
	
	initial	begin
		clk = 1'b0;
		#40
		
		address 	= 16'b0;
		data_write 	= 16'hee44;
		mem_write	= 1'b1;
		#40
		
		address 	= 16'b10;
		data_write 	= 16'hfee4;
		mem_write	= 1'b0;
		#40
		
		address 	= 16'b0;
		mem_read	= 1'b1;
		#40
		
		address 	= 16'b10;

		
	end
	
	always #10 clk = ~clk;

endmodule