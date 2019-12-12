//half-adder
module add_half(a,b,sum,c_out);
input a,b;
ouput sum, c_out;
  xor(sum,a,b);
  and(c_out,a,b);
endmodule
