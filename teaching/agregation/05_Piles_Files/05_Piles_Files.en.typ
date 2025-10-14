#import "../../utils/tableau.typ" : tableau, dev, recap, item, warning
#import "@preview/cetz:0.3.3" : *
#import "../../deps.typ" : *

#set text(lang: "eng")

#show : tableau

= Implementations and application of stacks, queues and priority queues

== Definitions @TOR @NSIT[7]


#grid(columns:(85%, 1fr), column-gutter: 1em,
[
#item("Definition")[A stack][
  is a data structure with the operations _push_, _pop_, and _test_empty_ that respectively add an element, remove the element added #underline[last] from the stack, and check if the stack is empty.
]

#item("Definition")[A queue][
  is a data structure with the operations _insert_, _pull_, and _test_empty_ which respectively add an element, remove the element added #underline[first] in the queue, and test whether the queue is empty.
]

#item("Remark")[LIFO et FIFO][
  denoting Last In First Out and First In First Out respectively are types of data structures. A stack is of type LIFO while a queue is of type FIFO.
]
],
stack(dir: ttb, spacing: 1em,
align(center, canvas(length: 1em, {
  import draw: *
  for i in range(6) {
    circle((0, i * 0.8), fill: white, radius: (1.3, 0.7))
  }
  set-style(mark: (end: "straight"))
  bezier((0.25, 4), (2, 5), (1, 5))
  bezier((-2.5, 5), (-0.25, 4), (-1.5, 5))
  content((0, 5.5), [LIFO])
})),
align(center, canvas(length: 1em, {
  import draw: *
  for i in range(6) {
    circle((0, i * 0.8), fill: white, radius: (1.3, 0.7))
  }
  set-style(mark: (end: "straight"))
  bezier((0, 4), (2, 5), (1, 5))
  bezier((-2, -1.5), (0, -0.7), (-0.7, -1.5))
  content((0, 5.5), [FIFO])
}))
)
)





#item("Definition")[A priority queue][
  is a data structure with the operations _insert_with_priority_, _pull_highest_priority_element_ and _test_empty_ which respectively add an element with its associated priority, remove the element with maximum priority and test if the queue is empty.
]

#item("Remark")[Other operations on priority queues][
  are possible. Some algorithms may require changing priority, accessing the highest priority element, the number of elements in the structure etc.
]

#item("Remark")[][
  The interface of these data structures for the programmer can be done in two ways:
- With mutable structures, the functions `insert` and `pull` are of return type `unit` or `void`.
- With immutable structures, the functions `insert` and `pull` then return a new data structure with the desired change.
]

== Implementation

=== Implementation with arrays

#grid(columns: (75%, 1fr), column-gutter: 1em,
item("Definition")[A stack][
  can be implemented by an array and a stack end index. However, this stack is of bounded size.
],
align(center, image("pile_shemas.png")))

#grid(columns: (75%, 1fr), column-gutter: 1em,
item("Definition")[A queue][
  can be implemented by an array, a start and end index of the queue, considering the array cyclically. However, this queue is of bounded size.
],
align(center, image("shemas_file.png")))

#item("Definition")[A priority queue][
  can be implemented by an array, either keeping the sorted array on insertion or selecting the highest priority element on scrolling.
]

#item("Definition")[A binary max-heap][
is a left-nearly complete binary tree such that each node in the heap is larger than its children. Therefore, the largest element in a max-heap is its root.
]

#item("Remark")[Sosa Stradonitz's notation][
allows a heap to be implemented as an array $T$ with $T[0]$ the root and if $i$ is the index of a node, then $2i + 1$ is $2i + 2$ are its left and right children if they exist and $floor(i / 2)$ is its parent if $i$ is not the root.
]

#item("Definition")[Sifting][
is a principle used for operations on a heap. It takes an almost complete binary tree $T$ which is a heap except possibly at index $i$ and which moves up (`pack_ascendant`) when $i$ is larger than its parent or down (`pack_descendant`) when $i$ is smaller than one of its children in order to transform $T$ into a heap.
]

#grid(columns: (45%, 55%), column-gutter: 0.2em,
```python
pack_ascendant(T, i) :
  if i != 0 and T[i] > T[i//2]:
    T[i],T[i//2] = T[i//2],T[i]
    pack_ascendant( T, i//2)
```,
```python
pack_descendant(T, i):
  k = i
  if 2i+1 < T.size and T[k] < T[2i+1]:
    k = 2i+1
  if 2i+2 < T.size and T[k] < T[2i+1]:
    k = 2i+2
  if k != i:
    T[i], T[k] = T[k], T[i]
    pack_descendant(T, k)
```
)


#item("Implementation")[A priority queue][
can be implemented using sifting operations on heaps. We can then implement the `insert` and `extract_max` functions.
]

#grid(columns: (50%, 50%), column-gutter: 1em,
```python
insert(T, e):
  T.size = T.size + 1
  T[T.size - 1] = e
  pack_ascendant(T, T.size - 1)
```,
```python
pull_max(T):
  m = T[0]
  T[0] = T[T.size - 1]
  T.size = T.size - 1
  pack_descendant(T ,0)
  return m
```)

If we want structures of variable size, we must use other implementation methods.

=== Implementation with dynamic table

#item("Implementation")[A stack][
can be implemented using a dynamic table and an end of stack index.
]

#item("Implementation")[A queue][
can be implemented using a dynamic table, a start and end of queue index. When changing the size, we will take care to correct the possible cycle in the structure.
]

#item("Implementation")[A priority queue][
can be implemented using a dynamic table, either by keeping the sorted table on insertion, or by selecting the element with the highest priority on scrolling.
]

=== Implementation with linked lists

#item("Implementation")[A stack][
can be implemented using a linked list. The top of the stack corresponds to the head of the list.
]

#item("Remark")[][
For an immutable implementation, this stack corresponds to the Ocaml list type.
]

#item("Implementation")[A queue][
can be implemented using a cyclic linked list, and a pointer to the last element of the list. The elements are scrolled from the head of the list, and pushed to the end of the list.
]

#item("Complexity")[][
Here are the complexities of the implementations of stacks, queues and priority queues.
]

#colbreak()

#{
set table.cell(align: center + horizon)
set par(leading: 0.2em)
table(
  columns : 7,
  stroke: (i, j) => {
    if i != 0 and j != 0 and j != 1 { black }
  },
  table.cell(rowspan: 2)[],
  table.vline(),
  table.cell(colspan: 2)[Stack],
  table.vline(),
  table.cell(colspan: 2)[Queue],
  table.vline(),
  table.cell(colspan: 2)[Priority queue],
  table.vline(),
  [push],
  table.vline(),
  [pop],
  [insert],
  table.vline(),
  [pull],
  [insert],
  table.vline(),
  [pull],
  table.hline(),
  [Table],
  table.hline(),
  [$cal(O)(1)$],
  [$cal(O)(1)$],
  [$cal(O)(1)$],
  [$cal(O)(1)$],
  [$cal(O)(log(n))$],
  [$cal(O)(log(n))$],
  
  [Dynamic table],
  table.hline(),
  [$cal(O)(1)^*$],
  [$cal(O)(1)^*$],
  [$cal(O)(1)^*$],
  [$cal(O)(1)^*$],
  [$cal(O)(log(n))^*$],
  [$cal(O)(log(n))^*$],
  
  [Chained list],
  table.hline(),
  [$cal(O)(1)$],
  [$cal(O)(1)$],
  [$cal(O)(1)$],
  [$cal(O)(1)$],
  [$cal(O)(n)$],
  [$cal(O)(1)$]
)
}

=== Cross implementations

#item("Implementation")[A queue][
It is possible to implement a queue with two stacks. However the scroll operation is of constant amortized complexity.
]

#item("Implementation")[A stack][
It is possible to implement a stack with two queues, however the complexity of the scroll operation is linear.
]

#dev[
#item("Implementation")[A queue][
It is possible to implement a queue with six stacks with a constant complexity.
]
]

== Application @COR3 @TOR
// TODO PUT THIS BACK ON HEADING
//

=== Algorithmic

#item("Application")[A graph traversal][
is implemented using a stack, a queue or a priority queue.
]

#item("Example")[Breadth-first traversal][
of a graph uses a queue.
]

#item("Example")[Depth-first traversal][
of a graph uses a stack.
]
#item("Application")[Greedy algorithms][
, i.e. algorithms that at each step choose the locally optimal solution, often rely on a priority queue to choose the most advantageous option.
]
#item("Example")[Knapsack problem][
To fill a backpack with valuable objects, it is possible to successively choose the most valuable objects that can be added. This is a greedy algorithm that does not always give the optimal solution.
]

#item("Application")[Shortest path algorithms][
such as Dijsktra and A\* use stacks.
]

#item("Application")[Prim and Kruskal algorithms][
for computing a minimum spanning tree use a stack.
]

#item("Example")[Graham's algorithm][
computes the convex hull of a set of points that are not all aligned.
]

#item("Application")[][

]

#dev[
#item("Application")[Priority queue sort][
is a sorting method by assimilating the priorities and values ​​of the elements. Depending on the implementation of the priority queue, the complexity of this sort can be optimal.
]

// #item("Remark")[The optimality of a priority queue][
// is reached when it allows to implement an optimal sort. We cannot make a priority queue better than $cal(O)(#todo)$ to thread and/or scroll_max.
// ]
]

#item("Definition")[Reverse polar notation][
allows to write arithmetic expressions without parentheses and without ambiguity on the order of operations.
]

#item("Application")[The evaluation of a formula in reverse Polish notation][
is done using a stack where numbers and operations are popped and the result is stacked.
]

#item("Application")[The yard algorithm][
allows, using a stack, to transform parenthesized infix arithmetic expressions into expressions in reverse Polish notation.
]

=== Application to computer operation

#item("Application")[The call stack][
is a part of the virtual addressing of a process. It is used to store local variables and the stack frame at each function call.
]

#item("Remark", show-title: false)[Graph Traversal Recursive Call][
*A graph traversal by recursive call*
implicitly uses the call stack as a stack as does the breadth-first traversal.
]

#item("Application")[The history of modifications][
in a text editor is also an example of the use of a queue.

]

#item("Application")[Scheduling policies][
are used involving stacks and queues:
- FIFO consists of maintaining a process queue.
- Shortest Job First consists of maintaining a priority queue of processes by taking the execution time as priority.
- Round Robin is a preemptive scheduling algorithm that, like FIFO, maintains a queue of processes, but suspends a process if it takes too long and puts it at the end of the queue.
- MultiLevel Feedback Queue works similarly to Round Robin but with several queues that all have different "priorities". When a process is interrupted, it is pushed into a queue of lower "priority". The next process to load is scrolled first in the highest priority queues. Periodically, all processes are put back into the highest priority queue.
]

#item("Application")[Different cache replacement policies][
exist:
- FIFO consists of maintaining a queue of processes.
- Shortest Job First consists of maintaining a process priority queue, taking the execution time as priority.
- LRU (Least Recently Used), we remove the element accessed the longest ago. For this, we maintain a minimum priority queue, with the access time as priority.
- Since the implementation of LRU is too expensive for low-level applications, we can approximate it by adding an "access bit" to a queue, which is set to 1 when we access the element in the cache. When we scroll the element to be removed, if the access bit is at 1, we put it back in the queue with an access bit at 0, and we try again by scrolling the next element.
]





#recap()

#bibliography(read("../bib.yaml", encoding: none))