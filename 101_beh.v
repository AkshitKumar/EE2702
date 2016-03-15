module mealy(
in,	//input
out,	//output
rst,	//reset
clk	//clock
);

input in, rst, clk;
output out;

reg[1:0] S;
reg out;

initial begin
	S <= 2'b00;
	out <= 0;
end

always @ (posedge clk, posedge rst)
begin
	if(rst) begin
		S <= 2'b00;
		out <= 0;
	end
	else begin
		case (S)
			2'b00: begin
			if(in) begin S <= 2'b01; out <= 0; end
			else begin S <= 2'b10; out <= 0; end
			end
			
			2'b01: begin
			if(in) begin S <= 2'b01; out <= 0; end
			else begin S <= 2'b11; out <= 0; end
			end
			
			2'b10: begin
			if(in) begin S <= 2'b01; out <= 0; end
			else begin S <= 2'b10; out <= 0; end
			end
			
			2'b11: begin
			if(in) begin S <= 2'b01; out <= 1; end
			else begin S <= 2'b10; out <= 0; end
			end
			
		endcase
	end
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
