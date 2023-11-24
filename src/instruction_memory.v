module instruction_memory(instruction, pc);

	input 	wire	[15:0] 		pc;
	output	wire 	[15:0] 		instruction;
	
	wire 	[15:0] 	rom_add = pc[15:1];
	
	// write the program instructions here 
	// just uncomment the following section 
	// "assumming it is 16 instruction"
	
	
	reg	[15:0] rom[15:0];
	 
	initial begin 
			rom[0] 	= 16'h70;
			rom[1] 	= 16'hf0;
			rom[2] 	= 16'h0e;
			rom[3] 	= 16'h50;
			rom[4] 	= 16'h60;
			rom[5] 	= 16'h80;
			rom[6] 	= 16'h0;
			rom[7] 	= 16'h0;
			rom[8] 	= 16'h0;
			rom[9] 	= 16'h0;
			rom[10] = 16'h15f;
			rom[11] = 16'h0;
			rom[12] = 16'h0;
			rom[13] = 16'h0;
			rom[14] = 16'h0;
			rom[15] = 16'h0;
	end
	
	assign instruction = rom[rom_add];
	
endmodule
	
	