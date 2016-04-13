module jk(q,j,k,clk,rst);
input j,k,clk,rst;
output reg q;
always@(posedge clk) begin
	if(rst) begin
		q <= 0;
	end
	else begin
		case({j,k})
			{1,1}: begin
				q <= ~q;
			end
			{1,0}: begin
				q <= 1;
			end
			{0,1}: begin
				q <= 0;
			end
			{0,0}: begin
				q <= q;
			end
		endcase
	end
end
endmodule

/*
module clk_divide (Count, ip_clk);
input ip_clk;
output Count;

reg [24:0] Counter; //24 bit counter!
assign Count = Counter[24:24]; //pick 24th bit! or 50MHZ/2^22

 always @ (negedge ip_clk)
 begin 
 Counter <= Counter+1;
end

endmodule
*/

module jkcounter(a,b,c,clk,rst);
output a,b,c;
input clk,rst;

//wire clkslow;
//clk_divide divider(clkslow, clk); 

wire a,b,c;
wire ja,jb,ka,kb,kc;
wire ta,tb,tc;

//Ja
and A1(tb,b,c);
or A2(ja,a,tb);
//Ka
not A3(tc,c);
or A4(ka,b,tc);
//Jb
not(ta,a); not(tc,c);
and B1(ta,ta,tc);
and B2(tc,a,c);
or B3(jb,ta,tc);
//Kb
not B4(ta,a);
or B5(kb,ta,c);
//Jc
not C1(jc,a);
//Kc
not C2(tb,b);
or C3(kc,a,tb);

/*
jk A(a,ja,ka,clkslow,rst);
jk B(b,jb,kb,clkslow,rst);
jk C(c,jc,kc,clkslow,rst);
*/

jk A(a,ja,ka,clk,rst);
jk B(b,jb,kb,clk,rst);
jk C(c,jc,kc,clk,rst);

endmodule