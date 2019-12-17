module universal_shift_reg(Data_Out, MSB_Out, LSB_Out, Data_In, MSB_In, LSB_In, s1, s0, clk, rst);
output[3:0] Data_Out;
output MSB_Out, LSB_Out;
input[3:0] Data_In;
input MSB_In, LSB_In;
input s1, s0, clk, rst;
reg[3:0] 	Data_Out;

assign MSB_Out = Data_Out[3];
assign LSB_Out = Data_Out[0];

always@(posedge clk) begin
	if(rst)Data_Out <= 0;
	else case({s1,s0})
		0: 	Data_Out <= Data_Out; //Hold
		1: 	Data_Out <= {MSB_In, Data_Out[3:1]}; //serial shift from MSB
		2:		Data_Out <= {Data_Out[2:0], LSB_In};
		3: 	Data_Out <= Data_In;
	endcase
	end
endmodule
