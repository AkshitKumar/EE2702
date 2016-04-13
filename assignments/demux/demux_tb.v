module demux_tb();
reg X,sel1,sel2;
wire A,B,C,D;

demux uut(
	.X(X),
	.sel1(sel1),
	.sel2(sel2),
	.A(A),
	.B(B),
	.C(C),
	.D(D)
	);

initial begin
	X = 0; sel1 = 0; sel2 = 0;
	#10 X=1'b0; sel1=1'b0; sel2 = 1'b1;
	#10 X=1'b0; sel1=1'b1; sel2 = 1'b0;
	#10 X=1'b0; sel1=1'b1; sel2 = 1'b1;
	#10 X=1'b1; sel1=1'b0; sel2 = 1'b0;
	#10 X=1'b1; sel1=1'b0; sel2 = 1'b1;
	#10 X=1'b1; sel1=1'b1; sel2 = 1'b0;
	#10 X=1'b1; sel1=1'b1; sel2 = 1'b1;
    #10 $finish;
end

initial begin
	$dumpfile("demux.vcd");
	$dumpvars;
end

endmodule