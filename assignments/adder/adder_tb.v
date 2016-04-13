module adder_tb();
	reg A;
	reg B;
	reg Cin;

	wire Sum;
	wire Cout;

	adder uut(
		.A(A),
		.B(B),
		.Cin(Cin),
		.Sum(Sum),
		.Cout(Cout)
	);

	initial begin 
		A = 0;
		B = 0;
		Cin = 0;

		#10 A = 1'b0; B = 1'b1; Cin = 1'b0;
		#10 A = 1'b0; B = 1'b0; Cin = 1'b0;
		#10 A = 1'b1; B = 1'b1; Cin = 1'b1;
		#10 A = 1'b1; B = 1'b0; Cin = 1'b0;
		#10 A = 1'b1; B = 1'b0; Cin = 1'b1;
		#10 A = 1'b0; B = 1'b1; Cin = 1'b1;
		#10 A = 1'b0; B = 1'b0; Cin = 1'b1;
		#10 A = 1'b0; B = 1'b1; Cin = 1'b0;

		#10 $finish;
	end

	initial begin
		$dumpfile("full_adder.vcd");
		$dumpvars;
	end

endmodule