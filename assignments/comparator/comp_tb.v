module comp_tb();
reg [1:0]A;
reg [1:0]B;

wire AltB;
wire AgtB;
wire AeqB;

comp uut(
	.AltB(AltB),
	.AgtB(AgtB),
	.AeqB(AeqB),
	.A(A),
	.B(B)
	);

initial begin
	A=2'b00; B =2'b01;
	#10 A=2'b00; B =2'b01;
	#10 A=2'b01; B =2'b01;
    #10 A=2'b01; B =2'b11;
	#10 A=2'b11; B = 2'b01;
	#10 $finish;
end

initial begin
	$dumpfile("comp.vcd");
	$dumpvars;
end

endmodule