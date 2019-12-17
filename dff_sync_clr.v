
module mydffposSync(input d, clk, clr, output qbar, output reg q);
	assign qbar = ~q;
	always @(posedge clk) //sync clear
	begin
		if(!clr) q<=0;
		else q<=d;
	end 
endmodule
