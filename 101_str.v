module mealy(in, clk, rst, out) ;

input in, clk, rst ;
output out;

reg A, B;

initial begin
	A<=0;
	B<=0;
end

always @ (posedge clk, posedge rst) 
begin 
	if(rst) begin
		A <= 0;
		B <= 0;
	end 
	else begin
		A <= ~in;
		B <= (~A&B) | in;
	end
end

//assign out = A&B&in;
out <= A&B&in;
endmodule

//testbench starts
module mealy_tb;

reg in, rst, clk;
wire out;

initial begin
	$dumpfile("test.vcd");
	$dumpvars(0,mealy_tb);
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


mealy uut(
.in(in),
.out(out),
.clk(clk),
.rst(rst)
);

endmodule
