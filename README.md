# Digital Logic Designs [IN-PROGRESS] :hammer::hammer::hammer: 
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

#### Stuctural Models
a) instantiate primitives and other modules and connect them with wires
b) interconnect objects to create larger structure with composite behaviour.

