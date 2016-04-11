module parity_tb();
reg [3:0]data_in;
wire parity_out;

parity uut(
	.data_in(data_in),
	.parity_out(parity_out)
	);

initial begin
	data_in = 4'b0000;
	#10 data_in = 4'b1000;
	#10 data_in = 4'b1010;
	#10 data_in = 4'b1011;
	#10 data_in = 4'b0010;
	#10 data_in = 4'b1110;
	#10 data_in = 4'b1111;
	#10 data_in = 4'b1001;
	#10 $finish;
end

initial begin
	$dumpfile("parity.vcd");
	$dumpvars;
end

endmodule
