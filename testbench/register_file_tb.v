`timescale 1ns/1ps

module register_file_tb;
	
	reg clk, rst, write_EN;
	reg 	[15:0]	reg_write_data;
	reg		[2:0]	reg_write_add, reg1_read_add, reg2_read_add;
	
	wire  	[15:0]	reg1_read_data,	reg2_read_data;
	
	register_file 	RF(
		clk, rst, write_EN, 
		reg_write_add, reg_write_data,
		reg1_read_add, reg1_read_data,
		reg2_read_add, reg2_read_data
	);
	
	initial	begin 
		rst = 1'b0;
		write_EN = 1'b1;
		#40
		
		rst = 1'b1;
		clk = 1'b0;
		
		
		reg_write_add 	= 3'b000;
		reg_write_data 	= 16'hfee5;
		#40
		
		reg_write_add 	= 3'b001;
		reg_write_data 	= 16'h5342;
		#40
		
		reg_write_add 	= 3'b010;
		reg_write_data 	= 16'ha334;
		reg1_read_add	= 3'b000;
		reg2_read_add	= 3'b001;
		#40
		
		reg_write_add 	= 3'b011;
		reg_write_data 	= 16'haae3;
		reg1_read_add	= 3'b001;
		reg2_read_add	= 3'b010;
		#40
		
		reg_write_add 	= 3'b100;
		reg_write_data 	= 16'hbb5;
		reg1_read_add	= 3'b011;
		reg2_read_add	= 3'b100;
		#40
		
		$finish;
	end
	
	always #20 clk = ~clk;
		
	//always #30 write_EN = ~write_EN;	
	

endmodule