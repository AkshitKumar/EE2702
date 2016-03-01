module parity(A,B,C,D,P);

input A,B,C,D;
output P;

assign P = (A^B)^(C^D);

endmodule

module tb_parity;

reg A,B,C,D;
wire P;

initial begin
	$monitor("A=%b B=%b C=%b D=%b \t P=%b",A,B,C,D,P);

	A=0;
	B=0;
	C=0;
	D=0;

	#5 A=0;B=0;C=0;D=1;
	#5 A=0;B=0;C=1;D=0;
	#5 A=0;B=0;C=1;D=1;
	#5 A=0;B=1;C=0;D=0;
	#5 A=0;B=1;C=0;D=1;
	#5 A=0;B=1;C=1;D=0;
	#5 A=0;B=1;C=1;D=1;
	#5 $finish;
end

parity top(A,B,C,D,P);

endmodule