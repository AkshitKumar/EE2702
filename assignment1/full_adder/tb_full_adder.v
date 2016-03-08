`include "full_adder.v"

module tb_full_adder();
reg a,b,cin;
wire sum,cout;

full_adder uut (
		.a (a),
		.b (b),
		.cin (cin),
		.sum (sum),
		.cout (cout)
	);

initial
begin
	// initialize signals
	a <= 1'b0 ; b<= 1'b0 ; cin <= 1'b0;
	#10 a <= 1'b0 ; b <= 1'b1 ; cin <= 1'b0;
	#10 a <= 1'b1 ; b = 1'b1 ; cin = 1'b0;
	#30 $finish;
end

initial begin
	$dumpfile("full_adder.vcd");
	$dumpvars;
end
endmodule