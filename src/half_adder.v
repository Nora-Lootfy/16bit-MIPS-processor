module half_adder(sum, carry, A, B);

	input wire A; 
	input wire B;
	
	output wire sum;
	output wire carry;
	
	assign {carry, sum} = A + B;

endmodule