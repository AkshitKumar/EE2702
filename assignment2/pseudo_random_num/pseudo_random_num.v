module pseudo_random_num(
	output XOR,a,b,c,d,
	input clk
	);

wire clk;
reg XOR,a,b,c,d;

initial begin
	// a,b,c,d can be assigned anything except all 0s
	a = 1;
	b = 0;
	c = 1;
	d = 0;
	XOR = 1;
end

always @(posedge clk)
begin
	XOR <= a ^ b;
	a <= XOR;
	b <= a;
	c <= b;
	d <= c;
end

endmodule