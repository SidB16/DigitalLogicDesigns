// This is an example of Hierarchical Verilog Code
//hierarchical structure in the Verilog code, 
//in which there is a top-level module that includes multiple instances of lower-level modules.

//lower-level modules:
//1) adder==> Adder module continuous assignment statements are used to specify the two-bit sum s1s0
//2) display ==> module for displaying a 7-segment display
//Main top-level module ==> adder_display

module hie-rar-chicalExample(intput x1,x2 output sum, c_out, a,b,c,d,e,f,g);
 module adder(input x1,x2 ouptut sum, c_out);
    assign sum = x1 ^ x2;
    assign c_out = x1 & x2;
    //multiple continious assignment statements = continious assignment
 endmodule
 
 module display(input x1, x2, output a, b, c, d, e, f, g);
    assign a = ~x2;
    assign b = 1;
    assign c = ~x1;
    assign d = ~x2;
    assign e = ~x2;
    assign f = ~x1 & ~x2;
    asssign g = x1 & ~x2;
 endmodule

//The purpose of the circuit is to generate the arithmetic sum of the two inputs x and y, using the adder
//module, and then to show the resulting decimal value on the 7-segment display.

 module adder_diplay(input x1, x2, output sum, c_out, a, b, c, d, e, f, g);
    //could use wires in place of sum or c_out!
    adder U1(x1, x2, sum, c_out);
    display U1(c_out,sum, a,b,c,d,e,f,g);
endmodule
