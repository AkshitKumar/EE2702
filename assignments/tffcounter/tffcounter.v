module t_ff(output reg q,input t, rst_n, clk,load,p);
always @ (posedge clk or negedge rst_n)
    if (!rst_n) q <= 1'b0;
	 else if(load) q<=p;
    else if (t) q <= ~q;
endmodule

module counter (output[2:0] q, input rst_n, clk,load,input [2:0] p);
    wire t2;
	 t_ff ff0 ( q[0], 1'b1, rst_n, clk,load,p[0]);
    t_ff ff1 ( q[1], q[0], rst_n, clk,load,p[1]);
    t_ff ff2 ( q[2], t2,   rst_n, clk,load,p[2]);
    and a1 (t2, q[0], q[1]);
    
endmodule    
