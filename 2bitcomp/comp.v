module comp(
	A[1:0],
	B[1:0],
	greater,
	equal,
	lesser
	);

input[1:0] A,B;
output greater, lesser , equal;

assign greater = (A[1] & ~B[1]) | (A[0] & ~B[1] & ~B[0]) | (A[1] & A[0] & ~B[0]);
assign equal = (~A[0] & ~A[1] & ~B[0] & ~B[1]) | (~A[1] & A[0] & ~B[1] & B[0]) | (A[0] & A[1] & B[0] & B[1]) | (A[1] & ~A[0] & B[1] & ~B[0]);
assign lesser = (~A[0] & B[0] & B[1]) | (~A[1] & ~A[0] & B[0]) | (B[1] & ~A[1]);

endmodule

module tb_comp;

reg[1:0] A,B;
wire greater,equal,lesser;

comp uut(
	.greater(greater),
	.equal(equal),
	.lesser(lesser)
	);

initial begin
	$monitor("A=%b B=%b f(A>B)=%b f(A=B)=%b f(A<B)=%b",A,B,greater,equal,lesser);
	A = 2'b00;
	B = 2'b00;

	#5 A=2'b01; B=2'b00;
	#5 A=2'b10; B=2'b00;
	#5 A=2'b11; B=2'b00;
	#5 $finish;
end

initial begin
	$dumpfile("comp.vcd");
	$dumpvars;
end

//comp top (A,B,greater,equal,lesser);
endmodule