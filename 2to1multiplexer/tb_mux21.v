`include "mux21"
module tb_mux21;
	reg A,B,SEL;
	wire Y;

	mux21 MUX(.a(A),.b(B),.sel(SEL),.y(Y));

	initial begin
		A = 1'b0;
		B = 1'b0;
		SEL = 1'b0;
		#45 $finish;
	end

	always #6 A = ~A;
	always #3 B = ~B;
	always #5 SEL = ~SEL;

	always @(Y)
    	$display( "time =%0t \tINPUT VALUES: \t A=%b B =%b SEL =%b \t output value Y =%b ",$time,A,B,SEL,Y);

 endmodule