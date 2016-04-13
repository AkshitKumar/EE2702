module counter_test;

	// Inputs
	reg rst_n;
	reg clk;
	reg load;
	reg [2:0] p;
	
	wire [2:0] q;

	// Instantiate the Unit Under Test (UUT)
	counter uut (
		.q(q), 
		.rst_n(rst_n), 
		.clk(clk),
		.load(load),
		.p(p)
	);

	initial begin
      clk <= 1'b0;
      forever #5 clk <= ~ clk;
    end
	 
	 initial begin
         load <= 1;
			p=3'b101;
         rst_n <= 1;
			@(posedge clk);
		    load <=0;	
		  repeat (20) @(posedge clk);
		  #0 load<=1;
		  @(posedge clk);
		    load <=0;
			 repeat (10) @(posedge clk);
		  $finish;
    end 

    initial begin
    	$dumpfile("counter.vcd");
    	$dumpvars;
    end 
endmodule
