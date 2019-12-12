# Digital Logic Designs 
A set of digital circuits I synthesized in my journey to learn about Digitial Logic. 
Written in Verliog.

## Verilog supports Structural and Behavioural Modelling
###### Strutural modeling: Gates & wire. Not well-suited for modelling-based SIMULATION and ANALYSIS
###### Behavioural modlling: abstract models of functions and squence. Well matched to SIMULATION Modeling.

Uses for Verilog in design process:
1) System design and Architeture
2) Design and Synthesis 
3) Simulation and verification
4) Functional simulation tests RTL logic & (Gate level) Timing simulation verifies timing specification but is time intensive.

#### Code style for sysnthesis differs from coding style in computer software programs!

## Level of abstraction for Verilog Design Entry: (LOWEST to HIGHEST level)
Switch level
Gate level (used for detialed entry
Truth Table entry (not common)
Boolean equations or RTL level (most common)
High level Behavioral and Algorithmic modelling (for abstract design and verification; increasing suppourt for systhesis)


from source:https://www.quora.com/What-is-a-GATE-level-netlist-in-Verilog-coding-What-is-the-difference-from-RTLs-netlist
#### Verilog is used for
1) model hardware for discrete-event simulation. (Behabioural functionality at RLT level, thereby sing rtl netlist)
2) input logic synthesis (logical functionality at GATE level, using GATE level netlist)
3) constructs testbenches

You always translate verilog source code into a netlist.

Constructs easy to synthesize:
1) Structural descriptions (RTL level behevioural mode) map to netlist
2) Assign statements to combinational logic
3) Case statement to multiplexers
4) Behavioural(always@) block ==> synthesis to combinational and sequential logic; However this depends on Sensitivy LIST!

#### From textbook 
(Stephen-Brown-Zvonko-Vranesic-Fundamentals-of-Digital-Logic)

"A typical Verilog design module may include several always blocks, each representing a part of the circuit being modeled.
An important property of the always block is that 
the statements it contains are evaluated in the order given in the code. 
This is in contrast to the continuous assignment statements,
which are evaluated concurrently and hence have no meaningful order."

"The part of the always block after the @ symbol, in parentheses, is called the sensitivity list. 
This list has its roots in the use of Verilog for simulation.
The statements inside an always block are executed by the simulator 
only when one or more of the signals in the sensitivity list changes value."

"When Verilog is being employed for synthesis of circuits, as in this book, the sensitivity list
simply tells the Verilog compiler which signals can directly affect the outputs produced by
the always block."

"If a signal is assigned a value using procedural statements, then Verilog syntax requires
that it be declared as a variable; this is accomplished by using the keyword reg"
End of From textbook************************************************

#### From Slides:
The sensitivity list controls when all statements in the always block will start to be evaluated. 
with context to always @ block:
1)for Combinational logic: sensitibity list contains all singals used for equation within block, then combinational logic synthesized.
If output path is not explicity defined (eg no else statment explicity stated) then latch is implied.

2)for Sequential logic: Sensivity list contaisn contains CLOCK EDGE

source for understanding CLOCK Edge which is related to Flip-flops! ==>
https://www.nandland.com/articles/flip-flop-register-component-in-fpga.html


## Synthesizing Combinational Logic
we always refer to Structural modeling and Behavioural Modeling. 
Synthesizable combinational logic can be described by:
1) A netlist of STRUCTURAL primitives or combinatorial modules.
2) Continious assignment statements
3) Level sensitive cyclic behaviours (assing @)

********Stuctural Models*********
a) instantiate primitives and other modules and connect them with wires
b) interconnect objects to create larger structure with composite behaviour.

#### example1: half-adder
module add_half(a,b,sum,c_out);
input a,b;
ouput sum, c_out;
  xor(sum,a,b);
  and(c_out,a,b);
endmodule

#### Multiplexer
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

## Hierarchical Verilog Code
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
