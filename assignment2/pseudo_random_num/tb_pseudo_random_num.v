module tb_pseudo_random_num();

reg clk;
wire XOR,a,b,c,d;

initial begin
	//$dumpfile("pseudo_random.vcd");
	//$dumpvars(0,tb_pseudo);
	$monitor("%g\t %b %b %b %b",$time,a,b,c,d);
	clk=0;
	#250 $finish;
end

always begin
	#5 clk <= ~clk;
end

pseudo_random_num pseudo(XOR,a,b,c,d,clk);
endmodule