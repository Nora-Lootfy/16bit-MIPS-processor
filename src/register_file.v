module register_file
(
	input clk,
	input rst,
	
	// write
	input 			write_EN, // enable
	input 	[2:0] 	reg_write_add, // 3bit address write
	input 	[15:0]	reg_write_data, // 16bit write data
	
	// first register read
	input	[2:0]	reg1_read_add,
	output	[15:0]	reg1_read_data,
	
	// second register read
	input	[2:0]	reg2_read_add,
	output	[15:0]	reg2_read_data
	
);
	// create register array of 8 registers each of size 16bit
	reg 	[15:0]	reg_array[7:0];
	
	always @ (posedge clk or negedge rst) begin	
		if (~rst) begin
			reg_array[0] <= 16'b0;
			reg_array[1] <= 16'b0;
			reg_array[2] <= 16'b0;
			reg_array[3] <= 16'b0;
			reg_array[4] <= 16'b0;
			reg_array[5] <= 16'b0;
			reg_array[6] <= 16'b0;
			reg_array[7] <= 16'b0;
		end
		else if (write_EN) 
			reg_array[reg_write_add] <= reg_write_data;
		
	end
	
	assign reg1_read_data = reg_array[reg1_read_add];
	assign reg2_read_data = reg_array[reg2_read_add];
		 
endmodule