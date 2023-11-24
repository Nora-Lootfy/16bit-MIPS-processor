`timescale 1ns/1ps

module full_adder_tb;
	
	reg A, B, Cin;
	wire sum, carry;
	
	full_adder fa(.sum(sum), .carry(carry), .A(A), .B(B), .Cin(Cin));
	
	initial begin 
		A <= 1'b0;
		B <= 1'b0;
		Cin <= 1'b0;
	
		#40
		
		A <= 1'b1;
		B <= 1'b0;
		Cin <= 1'b0;
		
		#40	 
		
		A <= 1'b0;
		B <= 1'b1;
		Cin <= 1'b0;
		
		#40
		
		A <= 1'b1;
		B <= 1'b1;
		Cin <= 1'b0;
		#40
		
		A <= 1'b0;
		B <= 1'b0;
		Cin <= 1'b1;
	
		#40	 
		
		A <= 1'b1;
		B <= 1'b0;
		Cin <= 1'b1;
		
		#40	
		
		A <= 1'b0;
		B <= 1'b1;
		Cin <= 1'b1;
		
		#40
		
		A <= 1'b1;
		B <= 1'b1;
		Cin <= 1'b1;
		
		
		
	end	
endmodule