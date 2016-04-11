module mux(m_out,A,B,select);
	input A,B,select;
	output m_out;

	assign m_out = (select) ? A : B;
endmodule