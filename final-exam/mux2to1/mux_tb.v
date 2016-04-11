module mux_tb();

reg A;
reg B;
reg select;

wire m_out;

mux uut(
	.A(A),
	.B(B),
	.select(select),
	.m_out(m_out)
	);

initial begin
	A = 0; B = 0; select = 0;
	#10 A = 1'b0; B = 1'b0; select = 1'b1;
	#10 A = 1'b0; B = 1'b1; select = 1'b0;
	#10 A = 1'b0; B = 1'b1; select = 1'b1;
	#10 A = 1'b1; B = 1'b0; select = 1'b0;
	#10 A = 1'b1; B = 1'b0; select = 1'b1;
	#10 A = 1'b1; B = 1'b1; select = 1'b0;
	#10 A = 1'b1; B = 1'b1; select = 1'b1;
	#10 $finish;
end

initial begin
	$dumpfile("mux.vcd");
	$dumpvars;
end

endmodule
