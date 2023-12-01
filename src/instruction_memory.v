module instruction_memory(instruction, pc);

	input 	wire	[15:0] 		pc;
	output	wire 	[15:0] 		instruction;
	
	wire 	[15:0] 	rom_add = pc[15:1];
	
	// write the program instructions here 
	// just uncomment the following section 
	// "assumming it is 16 instruction"
	
	// program in C
	/**
	*	int i = 1;
	* 	int sum = 0;
	*	for(i=0; i < 6; i++)
	*	 	sum += i;	
	*/
	
	// program assembly
	/**
	*	0:	lw $1, 2($0);		 ==> initial value
	*	2:	lw $2, 3($0);		 ==> final condition
	*	4:	lw $3, 4($0);		 ==> incremental value
	*	6:	Loop:	add	$4, $4, $1
	*	8:	add $1, $1, $3
	*	10:	beq	$4, $2, skip
	*	12: jump loop
	*	14: skip: hlt
	*/
	
	// program compiled
	/**
	*	0:	001_000_001_0000010
	*	2:	001_000_010_0000011
	*	4:	001_000_011_0000100
	*	6:	000_001_100_100_0000
	*	8:	000_011_001_001_0000
	*	10:	011_100_010_0000001
	*	12: 101_0000000000011
	*	14: 111_xxxxxxxxxxxxx
	*/
	
	// program assembly another way
	/**
	*	0:	lw $1, 2($0);		 ==> initial value
	*	2:	lw $2, 3($0);		 ==> final condition
	*	4:	Loop:	addi	$4, $4, #1
	*	6:	addi $1, $1, #1
	*	8:	beq	$4, $2, skip
	*	10: jump loop
	*	12: skip: hlt
	*/
	
	// program compiled
	/**
	*	0:	001_000_001_0000100
	*	2:	001_000_010_0000110
	*	4:	100_011_011_0000001
	*	6:	100_001_001_0000001
	*	8:	011_100_010_0000001
	*	10:	101_0000000000010
	*	12: 111_0000000000000
	*/
	
	reg	[15:0] rom[15:0];
	 
	initial begin 
		/*
			rom[0] 	= 16'b001_000_001_0000100;
			rom[1] 	= 16'b001_000_010_0000110;
			rom[2] 	= 16'b001_000_011_0001000;
			rom[3] 	= 16'b000_011_100_100_0000;
			rom[4] 	= 16'b000_011_001_001_0000;
			rom[5] 	= 16'b011_100_010_0000001;
			rom[6] 	= 16'b101_0000000000011;
			rom[7] 	= 16'b111_0000000000000;
		*/	rom[0] 	= 16'b001_000_001_0000100;
			rom[1] 	= 16'b001_000_010_0000110;
			rom[2] 	= 16'b100_011_011_0000001;
			rom[3] 	= 16'b100_001_001_0000001;
			rom[4] 	= 16'b011_100_010_0000001;
			rom[5] 	= 16'b101_0000000000010;
			rom[6] 	= 16'b111_0000000000000;
			rom[7] 	= 16'b0;
			rom[8] 	= 16'b0;
			rom[9] 	= 16'b0;
			rom[10] = 16'b0;
			rom[11] = 16'b0;
			rom[12] = 16'b0;
			rom[13] = 16'b0;
			rom[14] = 16'b0;
			rom[15] = 16'b0;
	end
	
	assign instruction = rom[rom_add];
	
endmodule
	
	