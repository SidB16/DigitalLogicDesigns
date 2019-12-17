module register(R, Clock, E, clr, Q);
	parameter n = 8;
	input [n-1:0] R;
	input Clock, E, clr;
	output reg [n-1:0] Q;
	
	always@(posedge Clock, negedge clr)
	begin
		if(!clr) Q <= 0;
		else if (E) Q <= R;
	end
endmodule
