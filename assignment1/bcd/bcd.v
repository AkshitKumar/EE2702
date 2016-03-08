module bcd(
	X[3:0],
	Y[3:0]
	);

input[3:0] X;
output[3:0] Y;

assign Y[0] = ~X[0];
assign Y[1] = ~(X[1] ^ X[0]);
assign Y[2] = X[2] ^ (X[1] | X[0]);
assign Y[3] = X[3] | (X[2] & (X[1] | X[0]));

endmodule

module tb_bcd;

reg[3:0] X;
wire[3:0] Y;

initial begin
	$monitor("X[0]=%b X[1]=%b X[2]=%b X[3]=%b \t Y[0]=%b Y[1]=%b Y[2]=%b Y[3]=%b",X[0],X[1],X[2],X[3],Y[0],Y[1],Y[2],Y[3]);

	X[0] = 0;
	X[1] = 0;
	X[2] = 0;
	X[3] = 0;

	#5 X = 4'b0000;
	#5 X = 4'b0001;
	#5 X = 4'b0010;
	#5 X = 4'b0011;
	#5 X = 4'b0100;
	#5 X = 4'b0101;
	#5 $finish;
end

bcd top (X,Y);
endmodule