module tb_counter();

reg clk;
wire q0,q1,q2,T0,T1,T2;

initial begin
	$dumpfile("counter.vcd");
	$dumpvars(0,tb_counter);
	$monitor("%g\t %b %b %b ",$time,q0,q1,q2);
	clk = 0;
	#200 $finish;
end

always begin
	#5 clk <= ~clk;
end

counter upcounter(q0,q1,q2,T0,T1,T2,clk);

endmodule