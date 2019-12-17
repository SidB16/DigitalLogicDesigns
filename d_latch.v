module D_latch(d, clk, q);
	input d, clk;
	output reg q;
	
	always @(d, clk)
	begin
		if(clk) q<=d;
		//else automatic latch
	end 
endmodule
