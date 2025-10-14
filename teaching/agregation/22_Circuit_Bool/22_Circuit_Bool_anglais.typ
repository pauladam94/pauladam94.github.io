#import "../../deps.typ": *
#show : tableau

#set text(lang: "eng")

= Functions and boolean circuits in computer architecture
== Context @NSIP[23]

#item("Definition")[Von Neumann architecture][
models a computer as two main components : a central memory unit  and a central processing unit, in that model data and program are stored in the same central memory.]

#item("Definition")[An instruction set architecture][
is the set of operation that a processor can execute.
]

#item("Definition")[Central processing unit][
is the component which execute the instructions. It is composed of a control unit and a Datapath.
]



#item("Definition")[An assembly language][
or assembler is the lowest-level programming language. It is composed of instruction and pseudo-instructions.
]

#item("Example")[][
  A simple 3 instructions instruction set architecture using memory can be composed of three instructions written in assembly language `add`, `store` and `load`.
]

#item("Definition")[A microarchitecture][
is the hardware implementation of a central processing unit of an instruction set.
]

== Combinational Logic Design @VAH[2]

=== Hardware circuits


#item("Definition")[A switch][
physically separates the source input from the output when it is off, it let the current flows otherwise.
]


#grid(columns: (60%, 40%), column-gutter: 1em,[
#item("History")[The evolution of switches][
- 1930s Relays
- 1940s Vacuum Tubes
- 1950s Discrete Transistors
- 1960s Integrated circuits (CMOS)
]

],[
  #item("Figure")[ @VAH[Fig 2.3] ][
    #align(center)[
      #image("Schema_interrupteur.png", width: 60%)
    ]
  ]
])

#item("Idea")[][
  To "compute" we need to implement functions with input and output wires with switched connected between each other.
]

#grid(columns: (50%, 40%), column-gutter: 1em,
item("Figure")[NOT, OR, AND Gates@VAH[fig 2.8]][
  We can implement classic `NOT`, `OR` et `AND` gates~:
],
align(center, image("Schéma_portes_transistors.png"))
)

#grid(columns: (60%, 40%), column-gutter: 1em,
[
  #item("Remark")[Other gates :][
    The same way we can implement `NAND`, `OR`, `XOR` and `XNOR` gate.
  ]
],
align(center)[
  #image("nand_nor.png.png")
  @VAH[fig 2.45]
]
)


#grid(columns: (70%, 30%), column-gutter: 1em,
item("Definition")[A decoder][
is a higher-level building block commonly used in digital circuits. A decoder decodes an input $n$-bit binary number by setting one's of the decoder's $2^n$ outputs to `1`.
],
align(center, image("décodeur.png", width:60%))
)

#item("Definition")[A multiplexer][
   is another higher-level building block. An $n$ multiplexer has $n$ data inputs and `1` output, and allows only one input to pass through to that output.
]

#item("Remark")[][
  Multiplexers are sometimes called selectors because they select one input to pass through to out output.
]

#item("Définition")[Demultiplexers and encoders][
have roughly the opposite functionality of their counterparts, multiplexers and decoders.
]

#dev[
#item("Implementation")[$n$-bit adder@PAT[A.6]][
  
With classic logic gates, we can implement a $n$-bit adder which computes the sum of two $n$ bits binary numbers with $cal(O)(log n)$ critical path complexity.
]
]

=== Boolean function simplification @NSIP[22.2]

#item("Definition")[Boolean function][
  A Boolean function is a mapping of each possible combination of values for the function's variables (the inputs) to either a `0` or `1` (the output).
]

#item("Definition")[A truth table][
  's left side lists the input variables, and shows all possible value combinations of those inputs, with one row per combination. A truth table's right side would the nlist the funtion's output value.
]

#item("Example")[][
  The figure 11 and the remark 12 shows some truth tables of logic gates `NOT`, `AND`, ...
]

@VAH[Chap 6.2]

#grid(columns: (50%, 50%), column-gutter: 1em, [
  #item("Method")[Karnaugh maps][
    are a visual method intended to assist humans to algebraically minimize Boolean equations having a few (two to four) variables. The idea is to graphically place minterms adjacent to one another if those midterms differ in one variable only, so that we can combine them.
]], [
  #item("Example")[][
    #align(center, image("./karnaugh.png", width:70%))
  ]
]
)


#item("Remarque")[Quine-McCluskey algorithm][
works by enumerating all minterms and it works reasonably for function with perhaps tens of variables. However, for larger functions, just listing all the minterms could result in a huge amount of data.
]
//#v(1em)


#item("Definition")[Combinational circuit][
is a digital circuit whose outputs depend solely on the present combination if the circuit inputs' values is called a combinational circuit.
]

== Sequential circuit @VAH[3]
=== The Basic Storage Method

#item("Definition")[A sequential circuit][
 is a circuit whose outputs depend not only on the circuit's present inputs, but also on the circuit's present state, which is all the bits stored in the circuit.
]

//=== Mémoire

#grid(columns: (60%, 40%), column-gutter: 1em,
[#item("Définition")[A basic SR Latch][
  implements the bit storage building block. The circuit, as shown Figure 27, consists of just a pair of cross-coupled `NOR` gates.
]],[
#item("Figure")[@VAH[fig 3.4]][
  #align(center, image("SR_latch.png", width:40%))
]
])

#item("Definition")[Clock signal][
is a pulsating signal that pulses at a constant rate.  
]

#item("Definition")[][
A circuit whose storage elements can only change when a clock signal is active is known as a *synchronous circuit*. A sequential circuit that does not use a clock is called an *asynchronous circuit*.
]

#item("Definition")[D flip-flops][
A D latch stores whatever value is present at the latch's input whenever the closk pulses. 
]

#grid(columns: (40%, 55%), column-gutter: 1em, [
  #item("Definition")[A timing diagram][
is a curb which illustrate the evolution of a boolean value in a circuit in function of the time.
  ]
], [
  #item("Example")[Timing diagram][
    #align(center, image("D_latch.png", width: 40%))
  ]
]
)


=== Memory and Register

#item("Definition")[A register][
is a sequential circuit which can store multiples bits. It can be implemented using multiples D flip-flops.
]

#item("Definition")[RAM @NSIP[23.1]][
  The *Random Access Memory* is a circuit which stored data while powered. To read it takes an address as input and outputs the corresponding value. To write it takes an address and a value and changes its internal state.
]

#item("Definition")[SRAM@PAT[A-9]][
which stands for static random access memories is a memory where date are stored statically (as in flip-flops). It uses 6 transistors per bit.
]

#item("Definition")[DRAM][
which stands for dynamic random access memories is a memory where date are stored dynamically. It uses a transistor and a capacitor per bit.
]

== Processor @NAN

=== Moore et Mealy Machines @VAH[6.3 index Mealy]

#item("Definition")[A FSM][
is a finite state transducer.
]

#grid(columns: (50%, 50%), column-gutter: 1em, [
#item("Definition")[A Moore FSM][
is an FSM whose outputs are a function of the FSM's state.
]

#item("Definition")[A Mealy FSM][
is an FSM whose outputs are a function of the FSM's states and inputs.
]
], [
#item("Figure")[@VAH[6.50]][
#image("image.png", width: 90%)
]
]
)

=== Control unit and Datapath @VAH[8]

#item("Definition")[Datapath][
The basic datapath can perform the following possible datapath operations in a given clock cycle :
- Loading data 
- Transforming that data
- Storing the new data
]

#item("Definition")[The Control Unit][
reads each instruction from instruction memory and then executes that instruction on the datapath. It would perform the folowwing tasks :
- fetch
- decode
- execute
]

#dev[
#item("Implementation")[@VAH[8.3] Datapath for the Three-Instructon Processor][]

#item("Implementation")[Control Unit for the Three-Instructon Processor][]
]

=== Performances @PAT[1.6]

#item("Definition")[A critical path][
in a circuit is a path between an input and an output passing through the most gates. It determines the clock's period.
]

#item("Definition")[Clock cycles per instruction (CPI)][
Average number of clock cycles per instruction for a program or program fragment.
]

#item("Proposition")[The classic CPU performance equation][is measured with $f_(max) times "CPI"$ with $f_(max)$ the clock maximal frequency.
]

#item("Definition")[Pipelining @PAT[1.8]][
is an elegant technique that runs programs faster by overlapping the execution of instructions.
]

#item("Example")[@PAT[fig 4.42]][
  #align(center, image("Pipeline.png", width: 100%))
]

#item("Remark")[Hazards @PAT[4.6 p287]][
There are situations in pipelining when the next instruction cannot execute in the following clock cycle. These events are called hazards.
]

#item("Figure")[Growth in processor performance since the mid-1980s][
#image("image (1).png", width: 40%)
]
#recap( show-heading-big-numeral: false )

#bibliography(read("../bib.yaml", encoding: none))