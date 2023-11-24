module full_adder(sum, carry, A, B, Cin);

	input wire A; 
	input wire B;
	input wire Cin;
	
	output wire sum;
	output wire carry;


	wire I1, I2, I3;
	
	half_adder		HA_1(.sum(I1), .carry(I2), .A(A), .B(B));
	half_adder		HA_2(.sum(sum), .carry(I3), .A(I1), .B(Cin));
	
	assign carry = I3 || I2;
endmodule