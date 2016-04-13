module jkcounter_tb();
reg clk,rst;
wire a,b,c;

jkcounter uut(
	.a(a),
	.b(b),
	.c(c),
	.clk(clk),
	.rst(rst)
	);

initial begin
		// Initialize Inputs
		clk = 1;
		rst = 1;
		#15 rst = 0;
		// Wait 100 ns for global reset to finish
		#200 $finish;
		// Add stimulus here
	end
	
always begin
		#5 clk = ~clk;
end

initial begin
	$dumpfile("test.vcd");
	$dumpvars;
end	
endmodule