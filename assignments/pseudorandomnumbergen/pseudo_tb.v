module pseudo_tb();
reg clk;
wire a0,a1,a2,a3;

pseudo uut(
	.clk(clk),
	.a0(a0),
	.a1(a1),
	.a2(a2),
	.a3(a3)
	);

initial begin
	clk = 0;
	#10 clk = ~clk;
	#10 clk = ~clk;
	#10 clk = ~clk;
	#10 clk = ~clk;
	#10 clk = ~clk;
	#10 clk = ~clk;
	#10 clk = ~clk;
	#10 clk = ~clk;
	#10 clk = ~clk;
	#10 clk = ~clk;
	#10 clk = ~clk;
	#10 clk = ~clk;
	#10 clk = ~clk;
	#10 clk = ~clk;
	#10 clk = ~clk;
	#10 clk = ~clk;
	#10 clk = ~clk;
	#10 clk = ~clk;
	#10 clk = ~clk;
	#10 clk = ~clk;
	#10 clk = ~clk;
	#10 clk = ~clk;
	#10 clk = ~clk;
	#10 clk = ~clk;
	#10 clk = ~clk;
	#10 clk = ~clk;
	#10 clk = ~clk;
	#10 clk = ~clk;
	#10 clk = ~clk;
	#10 clk = ~clk;
	#10 clk = ~clk;
	#10 clk = ~clk;
	#10 clk = ~clk;
	#10 clk = ~clk;
	#10 clk = ~clk;
	#10 clk = ~clk;
	#10 clk = ~clk;
	#10 clk = ~clk;
	#10 clk = ~clk;
	#10 clk = ~clk;
	#10 clk = ~clk;
	#10 clk = ~clk;
	#10 clk = ~clk;
	#10 clk = ~clk;
	#10 clk = ~clk;
	#10 clk = ~clk;
	#10 clk = ~clk;
	#10 clk = ~clk;
	#10 clk = ~clk;
	#10 clk = ~clk;
	#10 clk = ~clk;
	#10 clk = ~clk;
	#10 clk = ~clk;
	#10 clk = ~clk;
	#10 clk = ~clk;
	#10 clk = ~clk;
	#10 clk = ~clk;
	#10 clk = ~clk;
	#10 clk = ~clk;
	#10 clk = ~clk;
	#10 clk = ~clk;
	#10 clk = ~clk;
	#10 clk = ~clk;
	#10 clk = ~clk;
	#10 clk = ~clk;
	#10 clk = ~clk;
	#10 clk = ~clk;
	#10 clk = ~clk;
	#10 clk = ~clk;
	#10 clk = ~clk;
	#10 clk = ~clk;
	#10 clk = ~clk;
	#10 clk = ~clk;
	#10 clk = ~clk;
	#10 clk = ~clk;
	#10 clk = ~clk;
	#10 clk = ~clk;
	#10 clk = ~clk;
	#10 $finish;
end

initial begin
	$dumpfile("test.vcd");
	$dumpvars;
end

endmodule

