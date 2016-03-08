module counter(
	output q0,q1,q2,T0,T1,T2,
	input clk
	);

wire clk;
reg q0,q1,q2,T0,T1,T2;

initial begin
	q0 = 0;
	q1 = 0;
	q2 = 0;
	T0 = 0;
	T1 = 0;
	T2 = 0;
end

always begin
	if(q0 == 1 & q1 ==1 & q2 == 1)
	begin
		q0 = 0;
		q1 = 0;
		q2 = 0;
	end
	#5;
end

always @(posedge clk)
begin
	T0 = (~q0 & q1 & q2);
	T1 = q2;
	T2 = 1;

	q0 <= (T0 ^ q0);
	q1 <= (T1 ^ q1);
	q2 <= (T2 ^ q2);
end
endmodule