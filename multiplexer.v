//Multiplexer
//Sturctural implementation
module(x1,x2,x3,f);
input x1,x2,x3;
output f;
wire g,h;
  and(g, x1,x2);
  and(h,~x2,x3);
  or(f, g, h);
endmodule

//continious assingment implementation
module(x1,x2,x3,f);
input x1,x2,x3;
output f;
  assign f = (x1 & x2) | (~x2 & x3); //more than one continious assignment statments is called procedural assignments.
endmodule

//behavioural spcification
module(x1,x2,x3,f)
input x1,x2,x3;
output f;
reg f; //be mindful of this!  
// simulation jargon: It means that, once a variable’s value is assigned with a procedural statement, 
//the simulator “registers” this value and it will not change until the always block is executed again.
  always@(x1 or x2 or x3)
    if(x2 = 1) //if-else statment is an example of VeriLog **procedural statement, similar to loop statments.
      f = x1;
    else 
       f = x3; //Verilog syntax requires that procedural statments be contained
endmodule

//more compact Behavioural Implementation COOL!
module(input x1, x2, x3, output reg f);
  assing@(x1,x2,x3)
    if(x2 == 1)
      f = x1
    else
      f = x3
 endmodule

