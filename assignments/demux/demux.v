module demux(X,sel1,sel2,A,B,C,D);
input X,sel1,sel2;
output A,B,C,D;

assign A = X & ~sel1 & ~sel2;
assign B = X & ~sel1 & sel2;
assign C = X & sel1 & ~sel2;
assign D = X & sel1 & sel2;

endmodule