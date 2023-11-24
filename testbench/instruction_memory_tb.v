`timescale 1ns/1ps

module instruction_memory_tb;
	
	wire 	[15:0] 	instruction;
	reg 	[15:0] 	pc;
	
	
	instruction_memory 	InsMem(.instruction(instruction), .pc(pc));
	
	initial	begin
		pc = 16'd0;
		#40
		
		pc = 16'd2;
		#40
		
		pc = 16'd4;
		#40
		
		pc = 16'd6;
		#40
		
		pc = 16'd8;
		#40
		
		pc = 16'd10;
		
	end	

endmodule