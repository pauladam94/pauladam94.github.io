#import "../../utils/tableau.typ" : tableau, dev, recap, item
#import "@preview/cetz:0.3.2" : *
#show : tableau
#set text(lang: "eng")

// #set item(show-title: false)

= Memory: From Bits to Abstraction as Seen by Processes

#item("Motivation")[][ 
  Understand how hardware stores and manipulates information.
]

== @CSAPP Storing Information in Hardware

=== From Hardware to Bits

#item("Definition")[Bit][
  A computer uses binary data because the logical circuits used have only two states: powered or unpowered. A *bit* is a binary digit (0 or 1) representing the absence or presence of current.
]

#item("Definition")[Byte][
  In general, computer information is stored in sequences of 8 bits, called *bytes*.
]

#item("Definition")[Memory Hierarchy][
  A modern computer uses several types of memory:
]

#v(0.5em)

#align(center)[
#canvas({
  import draw: *
  import calc: *
  let w = 7
  let h = -0.8

  //triangle
  line((-w/2, 0), (0, 6*h))
  line((w/2, 0), (0, 6*h))
  line((-w/2, 0), (w/2, 0))

  //each roof
  line((-w/2*5/6, 1*h), (w/2*5/6, 1*h))
  line((-w/2*4/6, 2*h), (w/2*4/6, 2*h))
  line((-w/2*3/6, 3*h), (w/2*3/6, 3*h))
  line((-w/2*2/6, 4*h), (w/2*2/6, 4*h))
  line((-w/2*1/6, 5*h), (w/2*1/6, 5*h))

  //each name
  content((0, h*(1-1/2)), text(black, size: 15pt)[Secondary memory])
  content((0, h*(2-1/2)), text(black, size: 15pt)[RAM])
  content((0, h*(3-1/2)), text(black, size: 15pt)[L3])
  content((0, h*(4-1/2)), text(black, size: 15pt)[L2])
  content((0, h*(5-1/2)), text(black, size: 15pt)[L1])

  //particular case of "registres"
  content((-3, h*(7-1/2)), text(black, size: 15pt)[Registers])
  line((-1.8, h*(7-1/2)), (0, h*(6-1/2)), mark: (end: ">"))
    
  let e = 0.4
  let offset = 0.5 // °o° >_<
  let vx = -abs(h)*6/sqrt(36*h*h+w*w/4)
  let vy = w/2/sqrt(36*h*h+w*w/4)*h/abs(h)

  //left categories
  line((-w/2*6/6 + vx*offset, 0*h + vy*offset), (-w/2*6/6 + vx*(e+offset), 0*h + vy*(e+offset)))
  line((-w/2*5/6 + vx*offset, 1*h + vy*offset), (-w/2*5/6 + vx*(e+offset), 1*h + vy*(e+offset)))
  line((-w/2*4/6 + vx*offset, 2*h + vy*offset), (-w/2*4/6 + vx*(e+offset), 2*h + vy*(e+offset)))
  // line((-w/2*3/6 + vx*offset, 3*h + vy*offset), (-w/2*3/6 + vx*(e+offset), 3*h + vy*(e+offset)))
  // line((-w/2*2/6 + vx*offset, 4*h + vy*offset), (-w/2*2/6 + vx*(e+offset), 4*h + vy*(e+offset)))
  line((-w/2*1/6 + vx*offset, 5*h + vy*offset), (-w/2*1/6 + vx*(e+offset), 5*h + vy*(e+offset)))
  // line((-w/2*0/6 + vx*offset, 6*h + vy*offset), (-w/2*0/6 + vx*(e+offset), 6*h + vy*(e+offset)))
  line((-w/2*6/6 + vx*(e+offset), 0*h + vy*(e+offset)), (-w/2*1/6 + vx*(e+offset), 5*h + vy*(e+offset)))

  content((-w/2*6/6 + vx*(e+offset) - 1.2, (1-1/2)*h + vy*(e+offset)), text(black, size: 13pt)[HDD, SDD])
  content((-w/2*5/6 + vx*(e+offset) - 0.7, (2-1/2)*h + vy*(e+offset)), text(black, size: 13pt)[DRAM])
  content((-w/2*3/6 + vx*(e+offset) - 0.6, (4-1/2)*h + vy*(e+offset)), text(black, size: 13pt)[SRAM])

  //right categories
  line((w/2*6/6 - vx*offset, 0*h + vy*offset), (w/2*6/6 - vx*(e+offset), 0*h + vy*(e+offset)))
  line((w/2*5/6 - vx*offset, 1*h + vy*offset), (w/2*5/6 - vx*(e+offset), 1*h + vy*(e+offset)))
  line((w/2*4/6 - vx*offset, 2*h + vy*offset), (w/2*4/6 - vx*(e+offset), 2*h + vy*(e+offset)))
  // line((w/2*3/6 - vx*offset, 3*h + vy*offset), (w/2*3/6 - vx*(e+offset), 3*h + vy*(e+offset)))
  // line((w/2*2/6 - vx*offset, 4*h + vy*offset), (w/2*2/6 - vx*(e+offset), 4*h + vy*(e+offset)))
  line((w/2*1/6 - vx*offset, 5*h + vy*offset), (w/2*1/6 - vx*(e+offset), 5*h + vy*(e+offset)))
  line((w/2*0/6 - vx*offset, 6*h + vy*offset), (w/2*0/6 - vx*(e+offset), 6*h + vy*(e+offset)))
  line((w/2*6/6 - vx*(e+offset), 0*h + vy*(e+offset)), (w/2*0/6 - vx*(e+offset), 6*h + vy*(e+offset)))

  content((w/2*6/6 - vx*(e+offset) + 0.8, (1-1/2)*h + vy*(e+offset)), text(black, size: 13pt)[5-100ms])
  content((w/2*5/6 - vx*(e+offset) + 0.5, (2-1/2)*h + vy*(e+offset)), text(black, size: 13pt)[100ns])
  content((w/2*3/6 - vx*(e+offset) + 0.6, (4-1/2)*h + vy*(e+offset)), text(black, size: 13pt)[10ns])
  content((w/2*1/6 - vx*(e+offset) + 0.6, (6-1/2)*h + vy*(e+offset)), text(black, size: 13pt)[1ns])

  //titles
  content((-w/2-1.5, -h*0.8+4.1*h*(1+h/abs(h))), text(black, size: 20pt)[Technology])
  content((w/2+1.5, -h*0.8+4.1*h*(1+h/abs(h))), text(black, size: 20pt)[Acces time])
})
]

#v(0.5em)

  - *Secondary memory* (hard drive, SSD, etc.) stores most of the computer’s data. It is slow but inexpensive and space-efficient.
  - *RAM* (Random Access Memory) contains actively used data and running programs. It is erased when the computer shuts down.
  - *Cache* (L1, L2, or L3 depending on speed) stores the most frequently used information stored in RAM. It is much faster and is located on the CPU chip.
  - *Registers* store data directly within the processor between operations. They are very fast and directly accessible by the CPU but hold very little data (typically 4 to 8 bytes each).

#item("Definition")[Dynamic RAM][
  Modern computers use *Dynamic Random Access Memory* (DRAM). Physically, each bit in DRAM consists of a capacitor and a transistor. Since capacitor charge needs refreshing, DRAM is dynamic.
]

#item("Definition")[Physical Address][
  RAM is accessed using a *physical address*, which indexes an 8-bit memory cell to read/write.
]

#item("Definition")[Endianness][
  When accessing a contiguous sequence of bytes in memory, there are two conventions:
  - *Little-endian*: Least significant byte first
  - *Big-endian*: Most significant byte first
]

#item("Remark", show-title:false)[atoi][
  Most modern processors are little-endian, but network data exchange follows a big-endian convention.
]

=== From Bit to Data

#item("Definition")[Unsigned Integers][
  Positive integers (unsigned) are represented in base-2 notation: $b_0b_1...b_k$ represents 
  
  $ n = sum_(i=0)^k b_(k-i) 2^i $
]

#item("Definition")[Signed Integers][
  Signed integers use base-2 representation with two’s complement: $b_0b_1...b_k$ represents 
  $ n = -b_0 2^k + sum_(i=1)^k b_(k-i) 2^i $
]

#item("Example")[1110][
  Interpreted as a 4-bit signed integer, it equals $-2^3+2^2+2^1=-2$.
]

#item("Remark", show-title:false)[sizeof][
  In practice, the number of bits available for data storage is finite and depends on data type.
]

#item("Example")[Integer Sizes in C:][
#align(center, table(
  columns: 3,
  [Signed], [Unsigned], [Bytes],
  [short], [unsigned short], [2],
  [int], [unsigned int], [4],
  [long int], [unsigned long int], [4 or 8]
))
]

#v(0.5em)

#dev[
#item("Definition", show-title:false)[Floating Point Numbers][
  Real numbers are approximated by floating points, usually in IEEE-754 format, where $f = (-1)^s * m * 2^e$, with: $s \in \{0,1\}$, $m \in [1,2[$, $e \in ZZ$.
]
]

#item("Remark")[Representing characters][
  There is single agreed upon way of representing characters in memory, multiple conventions are possible : ASCII, Unicode, ISO-8859-1 etc...
]

#item("Example", show-title:false)[ASCII in C][
  In C, the `char` type uses the ASCII convention wich encodes characters in 1 byte.
]

#item("Definition")[Machine Instructions][
  Programs consist of *machine instructions* defined by an *instruction set architecture (ISA)*.
]

#item("Example", show-title:false)[Examples of ISAs][
  RISC-V, MIPS, and x86 are instruction sets.
]

#item("Definition")[Assembler][
  is the program that translates *assembly language* (human-readable text) into machine instructions.
]

== Point of view of a process @OSC

=== Process Memory Organization

#item("Definition", show-title:false)[Stack, Heap, Code][
  A process's memory space is divided into:
  - *Stack*: Stores local variables and function call data, grows downward.
  - *Heap*: Stores dynamically allocated data (e.g., `malloc` in C), grows upward.
  - *Code*: Contains the machine code of the executed program.
]

#v(1em)

#align(center)[
#canvas({
  import draw: *
  import calc: *
  let w = 12
  let h = -0.5

  
  //body
  line((-w/2, 1*h), (w/2, 1*h))
  line((-w/2, -1*h), (w/2, -1*h))
  line((-w*0.45,h),(-w*0.45,-h))
  line((-w*0.30,h),(-w*0.30,-h))
  line((-w*0.1,h),(-w*0.1,-h))
  line((w*0.45,h),(w*0.45,-h))
  line((w*0.25,h),(w*0.25,-h))

  // legend
  content((0,1.7*h), text(black, size: 15pt)[ascending addesses])
  line((-w/2, 1.5*h), (-w*0.2, 1.5*h))
  line((w*0.2, 1.5*h), (w/2, 1.5*h), mark: (end: ">"))

  //each name
  content((-w*0.375,0), text(black, size: 15pt)[Code])
  content((-w*0.2,0), text(black, size: 15pt)[Heap])
  line((-w*0.1, 0), (0, 0), mark: (end: ">"))
  content((w*0.35,0), text(black, size: 15pt)[Stack])
  line((w*0.25, 0), (w*0.15, 0), mark: (end: ">"))

})
]

=== Memory Usage in C

#item("Definition")[A Pointer][
  is a variable that contains the address of data rather than the data itself. The size of pointers depends only on the architecture. For example, *short\** and *long int\** data types have the same size.
]

#item("Remark", show-title:false)[.data vs Stack][
  - Global variables are allocated in the .data section.
  - Local variables are allocated in the stack.
]

#item("Remark", show-title:false)[Pointer Arithmetic][
  It is possible to perform operations on pointers to obtain different addresses:
  ```c
  int *ptr1;
  int *ptr2 = ptr1 + 1; // next address
  int *ptr3 = &(ptr1[1]); // equivalent to ptr1 + 1
  ```
]

#item("Remark", show-title:false)[Segmentation Fault][
  In practice, memory addresses are protected: if a process tries to access an unauthorized address, an exception is raised (segmentation fault). These permissions are stored in a table associated with the process.
]

#item("Remark", show-title:false)[Arrays][
  In C, tools like arrays (pointers) allow users to organize their program’s memory efficiently.
]

#item("Definition", show-title:false)[malloc, free][
  Some system calls allow memory management:
  - *malloc* allocates memory in the heap.
  - *free* releases that memory.
]

#item("Example", show-title:false)[malloc, free][
  For example, this program allocates, manipulates, and frees memory in the heap:
  ```c
  int *tab = malloc(size * sizeof(int)); // allocates an integer array of size 'size'
  tab[0] = 1; // manipulation of tab
  free(tab); // frees the memory
  ```
]

#dev[
#item("Remark")[Heap Allocation Policy @MOS[3.2.3]][
  Allocating memory in the heap can follow several policies to minimize wasted space.
]
]

#pagebreak()

#item("Example")[FIRST-FIT][
  Example allocation for this strategy:
  ```c
  char *tab1 = malloc(3); // A       Heap: [A|A|A| | | | | | ]
  char *tab2 = malloc(4); // B       Heap: [A|A|A|B|B|B|B| | ]
  free(tab1);             // C       Heap: [ | | |B|B|B|B| | ]
  char *tab3 = malloc(2); // D       Heap: [D|D| |B|B|B|B| | ]
  ```
]

=== Virtual Addressing

#item("Definition")[Virtual Addressing][
  A process does not have direct access to the physical memory address space; it interacts with memory indirectly, creating the illusion of a large, monolithic memory. This abstraction is made possible through *virtual addressing*, which provides processes with an address space (called virtual or logical) that is mapped to another memory space (called real or physical) stored in main and secondary memory.
]

#item("Remark", show-title:false)[Virtual Memory Size][
  The size of the virtual address space varies depending on the architecture: $2^32$ or $2^64$ depending on whether the architecture is 32-bit or 64-bit.
]

#item("Definition")[Page][
  Address spaces are divided into *pages* of consecutive addresses with a fixed size. On Linux, memory pages are 4KB in size.
]

#item("Remark", show-title:false)[Benefits of Virtual Memory][
  Virtual addressing allows for process memory isolation, provides the illusion of a simple and very large memory, and still allows quick access to pages in most cases.
]

#item("Definition")[MMU and VPT][
  Virtual addresses are converted into physical addresses by the *Memory Management Unit* (MMU) using the *Virtual Page Table* (VPT). Each process has a dedicated VPT.
] 

#align(center)[
#canvas({
  import draw: *
  import calc: *
  let w = 12
  let h = 0.5

  // RAM
  line((-w/8, 10*h), (w/8, 10*h))
  line((-w/8, 9*h), (w/8, 9*h))
  line((-w/8, 8*h), (w/8, 8*h))
  line((-w/8, 7*h), (w/8, 7*h))
  line((-w/8, 6*h), (w/8, 6*h))
  line((-w/8, 5*h), (w/8, 5*h))
  line((-w/8, 4*h), (w/8, 4*h))
  line((-w/8, 10*h), (-w/8, 4*h))
  line((w/8, 10*h), (w/8, 4*h))
  content((0,10.5*h), text(black, size: 11pt)[Main Memory])

  // HDD
  let hh = -2
  bezier((-w/8,(hh + 4)*h),(w/8,(hh + 4)*h),(-w/8,(hh + 5)*h),(w/8,(hh + 5)*h))
  bezier((-w/8,(hh + 4)*h),(w/8,(hh + 4)*h),(-w/8,(hh + 3)*h),(w/8,(hh + 3)*h))
  bezier((-w/8,(hh + 3)*h),(w/8,(hh + 3)*h),(-w/8,(hh + 2)*h),(w/8,(hh + 2)*h))
  bezier((-w/8,(hh + 2)*h),(w/8,(hh + 2)*h),(-w/8,(hh + 1)*h),(w/8,(hh + 1)*h))
  bezier((-w/8,(hh + 1)*h),(w/8,(hh + 1)*h),(-w/8,(hh + 0)*h),(w/8,(hh + 0)*h))
  line((-w/8,(hh + 4)*h),(-w/8,(hh + 1)*h))
  line((w/8,(hh + 4)*h),(w/8,(hh + 1)*h))
  content((0,(hh+5.2)*h), text(black, size: 11pt)[Secondary Memory])

  // VPT 1
  let xt1 = -5
  let yt1 = -1.5
  line((-w/8+xt1, 10*h+yt1), (w/8+xt1, 10*h+yt1))
  line((-w/8+xt1, 9*h+yt1), (w/8+xt1, 9*h+yt1))
  line((-w/8+xt1, 8*h+yt1), (w/8+xt1, 8*h+yt1))
  line((-w/8+xt1, 7*h+yt1), (w/8+xt1, 7*h+yt1))
  line((-w/8+xt1, 6*h+yt1), (w/8+xt1, 6*h+yt1))
  line((-w/8+xt1, 5*h+yt1), (w/8+xt1, 5*h+yt1))
  line((-w/8+xt1, 4*h+yt1), (w/8+xt1, 4*h+yt1))
  line((-w/8+xt1, 10*h+yt1), (-w/8+xt1, 4*h+yt1))
  line((-w/12+xt1, 10*h+yt1), (-w/12+xt1, 4*h+yt1))
  line((w/8+xt1, 10*h+yt1), (w/8+xt1, 4*h+yt1))
  content((xt1,10.5*h+yt1), text(black, size: 11pt)[VPT 1])

  // VPT 2
  let xt2 = 5
  let yt2 = -1.5
  line((-w/8+xt2, 10*h+yt2), (w/8+xt2, 10*h+yt2))
  line((-w/8+xt2, 9*h+yt2), (w/8+xt2, 9*h+yt2))
  line((-w/8+xt2, 8*h+yt2), (w/8+xt2, 8*h+yt2))
  line((-w/8+xt2, 7*h+yt2), (w/8+xt2, 7*h+yt2))
  line((-w/8+xt2, 6*h+yt2), (w/8+xt2, 6*h+yt2))
  line((-w/8+xt2, 5*h+yt2), (w/8+xt2, 5*h+yt2))
  line((-w/8+xt2, 4*h+yt2), (w/8+xt2, 4*h+yt2))
  line((-w/8+xt2, 10*h+yt2), (-w/8+xt2, 4*h+yt2))
  line((-w/12+xt2, 10*h+yt2), (-w/12+xt2, 4*h+yt2))
  line((w/8+xt2, 10*h+yt2), (w/8+xt2, 4*h+yt2))
  content((xt2,10.5*h+yt2), text(black, size: 11pt)[VPT 2])

  // Arrows
  line((xt1, 8.5*h + yt1), (-w*0.1, 4.75), mark: (start: "o", end: ">"))
  line((xt1, 6.5*h + yt1), (-w*0.1, 0), mark: (start: "o", end: ">"))
  line((xt1, 5.5*h + yt1), (-w*0.1, 2.75), mark: (start: "o", end: ">"))
  line((xt2, 9.5*h + yt2), (w*0.1, 4.75), mark: (start: "o", end: ">"))
  line((xt2, 8.5*h + yt2), (w*0.1, 0.5), mark: (start: "o", end: ">"))
  line((xt2, 6.5*h + yt2), (w*0.1, 4.25), mark: (start: "o", end: ">"))
  line((xt2, 4.5*h + yt2), (w*0.1, -0.5), mark: (start: "o", end: ">"))
})
]

#item("Remark", show-title:false)[Page Miss][
  To associate virtual addresses with their corresponding physical addresses, the MMU checks in the process's VPT whether the required page is in RAM. If not, an exception is raised, prompting the operating system to load the page into RAM from secondary memory.
]

#dev[
#item("Remark")[Multiple Page Replacement Policies @MOS[3.4]][
  exist when loading a page. If no space is available, the OS must choose a page to evict.
]
]


#recap()

#bibliography(read("../bib.yaml", encoding: none))

#align(bottom + center)[
  Axel Stengel
]