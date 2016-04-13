module dff(D,clk,res,Q);
input D,clk,res;
output reg Q;

always@(posedge clk,posedge res)
if(res) begin
	Q <= 1;
end
else begin
	Q <= D;
end
endmodule

module prng(input reset,clk, output q);
wire q0,q1,q2,q3;
assign d0 = q3^q2;
assign d1 = q0;
assign d2 = q1;
assign d3 = q2;

dff dff1( )


endmodule

module mealybehav(input clk,rst,output reg z_out,output x_in,clkslow);
clk_divide divider(clkslow,clk);
prng bleh(rst,clkslow,x_in);
reg [1:0] state,nextstate;
parameter S0 = 2'b00, S1 = 2'b01 , S2 = 2'b10;
always @ (posedge clkslow,posedge rst)
if(rst == 1)
	state <= S0;
else
    state <= nextstate;
    
  always @(state, x_in)
  case(state)
    S0: if(x_in) nextstate = S1; else nextstate = S0;
    S1: if(x_in) nextstate = S1; else nextstate = S2;
    S2: if(x_in) nextstate = S1; else nextstate = S0;
  endcase
  
  always @(state, x_in)
  case(state)
    S0: z_out = 0;
    S1: z_out = 0;
    S2: if(x_in) z_out = 1; else z_out = 0;
  endcase
endmodule