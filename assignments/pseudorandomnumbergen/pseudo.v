module pseudo(clk,a0,a1,a2,a3);
input clk;
output a0,a1,a2,a3;

wire w1;
xor G1(w1,a2,a3);

DFF D1(w1,clk,a0);
DFF D2(a0,clk,a1);
DFF D3(a1,clk,a2);
DFF D4(a2,clk,a3);

endmodule

module DFF(data,clk,q);
input data,clk;
output reg q;

initial begin
	q = 1'b1;
end

always@(posedge clk) begin
	q <= data;
end
endmodule