module moore(in, clk, rst, out); 

input in, clk, rst;
output out;

reg A, B, C;

initial begin
	A<=0;
	B<=0;
	C<=0;
end

always @ (posedge clk, posedge rst) 
begin
	if(rst) begin
		A<=0;
		B<=0;
		C<=0;
	end
	else begin
		A <= B&C&in;
		B <= ~in;
		C <= (B^in) | (~C&in) ;
	end
end

assign out = A&(~B) &(~C) ;

endmodule

//testbench starts
module moore_tb;

reg in, rst, clk;
wire out;

initial begin
	$dumpfile("test.vcd");
	$dumpvars(0,moore_tb);
	clk = 0;
	rst = 0;
	in = 0;
	
	#500 $finish;
end
	
always begin
	in <= $random % 2;
	#5 clk = 1;
	#5 clk = 0; 
end

moore uut(
.in(in),
.out(out),
.clk(clk),
.rst(rst)
);

endmodule
