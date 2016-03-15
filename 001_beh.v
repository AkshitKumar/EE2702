module mealy(
in,	//input
out,	//output
rst,	//reset
clk	//clock
);

input in, rst, clk;
output out;

reg[2:0] S;
reg out;

initial begin
	S <= 3'b000;
	out <= 0;
end

always @ (posedge clk, posedge rst)
begin
	if(rst) begin
		S <= 3'b000;
	end
	else begin
		case (S)
			3'b000: begin
			if(in) S <= 3'b001;
			else S <= 3'b010;
			end
			
			3'b001: begin
			if(in) S <= 3'b001;
			else S <= 3'b010;
			end
			
			3'b010: begin
			if(in) S <= 3'b001;
			else S <= 3'b011;
			end
			
			3'b011: begin
			if(in) S <= 3'b100;
			else S <= 3'b011;
			end

			3'b100: begin
			if(in) S <= 3'b001;
			else S <= 3'b010;
			end

			default: S <= 3'b000;
			
		endcase
	end
end

always @ (posedge clk, posedge rst)
begin
	if(rst)
	out <= 0;
	else if(S == 3'b100)
	out <= 1;
	else
	out <= 0;
end

endmodule

//testbench starts
module mealy_tb;

reg in, rst, clk;
wire out;

initial begin
	$dumpfile("test.vcd");
	$dumpvars(0,mealy_tb);
	clk = 0;
	rst = 0;
	in = 0;
	
	#500 $finish;
end
	
always begin
	in <= $random % 2;
	#5 clk = 1;
	#5 clk = 0; 
end

mealy uut(
.in(in),
.out(out),
.clk(clk),
.rst(rst)
);

endmodule
