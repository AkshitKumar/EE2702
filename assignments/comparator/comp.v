module comp(
	output AltB, AeqB,AgtB,
	input[1:0] A,B
    );

assign AltB = (A<B);
assign AgtB = (A>B);
assign AeqB = (A == B) ;

endmodule