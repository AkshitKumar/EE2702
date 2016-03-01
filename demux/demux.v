module demux(X,S1,S2,Y[3:0]);

input X;
input S1;
input S2;
output[3:0] Y;

assign Y[0] = X & ~S1 & ~S2;
assign Y[1] = X & S1 & ~S2;
assign Y[2] = X & ~S1 & S2;
assign Y[3] = X & S1 & S2;

endmodule

module tb_demux;

reg X, S1, S2;
wire[3:0] Y;

initial begin
	$monitor("X=%b S1=%b S2=%b Y[0]=%b Y[1]=%b Y[2]=%b Y[3]=%b",X,S1,S2,Y[0],Y[1],Y[2],Y[3]);
	X = 0;
	S1 = 0;
	S2 = 0;
	#5 X=1; S1=0; S2=0;
	#5 X=0; S1=1; S2=0;
	#5 X=1; S1=1; S2=0;
	#5 X=0; S1=0; S2=1;
	#5 X=1; S1=0; S2=1;
	#5 X=0; S1=1; S2=1;
	#5 X=1; S1=1; S2=1;
	#5 $finish;
end

demux top(X,S1,S2,Y);

endmodule