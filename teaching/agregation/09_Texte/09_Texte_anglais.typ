#import "../../utils/tableau.typ" : tableau, dev, recap, item
#import "@preview/cetz:0.3.1" : *
#show : tableau

#set text(lang: "eng")

= Algorithms for string manipulation. Examples and applications.

@TOR[9.5]
String manipulation is a fundamental notion in computer science. It is a core part of text editors, search engines, bioinformatics and everyday tooling.
It also introduces advanced algorithmic techniques and combinatorial problems.
 
== Pattern matching @CRO[1.3]
#item("Motivation")[][Pattern matching is driving force behind the famous CTRL+F keybinding to search for occurences of a text in a web page, or post-processing of command outputs using `grep`.]

#item("Definition")[An alphabet $Sigma$][is a finite non-empty set of *symbols*.]

#item("Example")[][${0, 1}$ for binary strings, ${A, C, G, T}$ for DNA sequencing, or the Unicode standard are all alphabets.]

#item("Definition")[A word, string, or pattern][
  (depending on the context) are finite sequences of symbols from an alphabet $Sigma$.
]

#item("Example")[][In "a#text(fill: red, [bra])cada#text(fill: red, [bra])nt", the pattern "#text(fill: red, [bra])" appears at positions 1 and 8.]

=== Naive algorithm
#item("Intuition")[][For each factor of size $|p|$ of a string $w$, check if it is equal to the pattern $p$, i.e. for each $i in [0, |w| ]$ check $w_i ... w_(i + |p| - 1) = p$.]

#item("Algorithme")[][
  ```python
n, m = len(w), len(p)
for i in range(0, n - m):
    # for j in range(i, i + m - 1):
    if w[i : i + m - 1] == p:
      print(p, "occurs at position", i)
  ```
]

#item("Complexity")[][This algorithm compares $|p| (|w| - |p| - 1)$ symbols in the worst case, which gives it a time complexity of $cal(O)(|w| |p|)$.]

=== More efficient approaches
#item("Intuition")[][The computational cost mostly comes from the comparison all $|p|$ symbols for each factor, even when there is no match. To avoid this, we could incrementally compute a *hash* of $w_i ... w_(i + |p| - 1)$ and compare it to the hash of $p$.]

#item("Algorithm")[The *Rabin-Karp* algorithm][ uses an _incremental_ hashing function. We can thus compute $"hash"(w_(i + 1) ... w_(i + |p|))$ by reusing $"hash"(w_i ... w_(i + |p| - 1)))$.
```ml
let hash_fact prev_hash fact fact' =
  prev_hash - hash fact.[0] + hash fact'.[String.length fact' - 1]
```
Si les hash sont égaux, on doit tout de même comparer le facteur de $w$ à $p$ afin de détecter les collisions de notre fonction de hachage.
]

#item("Note")[][If the hashes are equal, we must still compare $w_i ... w_(i + |p| - 1)$ and $p$ in order to detect potential collisions.]

#item("Complexity")[][In the best-case scenario, our hash function is collision-free. In this case, we never compare any factor that would not match our pattern.

In the worst-case scenario, we still require the same comparisons as the naive algorithm.]

#item("Pratical usage")[][In common scenarios and with a good hashing function, collisions are rare enough to justify the use of this algorithm.]

#item("Algorithm")[The *Boyer-Moore* algorithm][
 makes use of a _sliding window_ to search for occurences of $p$ in a string $w$. This algorithm has a time complexity of $cal(O)(|w| + |p|)$.
]

=== Methods using automatons
#item("Motivation")[][We'd like to extend our pattern matching algorithm to *regular patterns*, i.e. searching factors of a string $w$ that are part of the language $cal(L)(e)$, $e$ being a regular expression.]

#item("Application")[`grep`][
  is a command-line tool allowing regular patterns matching. It is greatly useful to find important informations within very large outputs from other commands.]

#item("Definition")[Regular expressions][are defined inductively as :
$
e eq.delta epsilon | a in Sigma | (e + e) | (e e) | e^*
$]

#item("Theorem")[Kleene][We can construct a deterministic finite automaton recognizing $cal(L)(e)$ for any regular expression $e$.]

#dev[
#item("Algorithm")[The Glushkov algorithm][constructs a deterministic finite automaton recognizing $cal(L)(e)$ with a time complexity of $cal(O)(2^(|e|))$. It can then be used to search for patterns within a string in linear time.]
]

== Measures of similarity
=== Distance @CRO[7.1]
#item("Definition")[The Hamming distance][measures the number of symbol mismatches between two strings of the same length.]
#item("Example")[][The Hamming distance between "ag#text(fill: red, [re])gation" and "ag#text(red, [er])gation" is 2.]
#item("Application")[Error correction codes][are the primary use case for the Hamming distance.]

#item("Definition")[The Levenshtein distance][is an _edit distance_ measuring the minimal amount of atomic operations (*substitution*, *insertion* and *deletion*) needed to transform one string into another.

Each of these operations has an associated cost, respectively $"Sub"(a, b)$, $"Ins"(a)$ et $"Del"(a)$.
]
#item("Note")[][The Levenshtein distance allows measurements of distances between strings that differ in length.]
#item("Example")[]["Djikstra" and "Dijkstraa" have a Levenshtein distance of 3 with a cost of 1 for each atomic operation.]

#item("Note")[Other edit distances][exist, such as the Damerau-Levenshtein distance which adds _transposition_ as an atomic operation. "Djikstra" and "Dijkstraa" would then have a distance of 2.]

=== String alignment @CRO[7.2]
#item("Definition")[The optimal string alignment problem][is closely tied edit distances. Given two strings $u$ and $v$, we want to find a sequence of atomic operations necessary to transform $u$ into $v$.]
#item("Example")[][An optimal alignment between "ACGA" and "ATGCTA" is:
$
A C G * * A\
A T G C T A
$
We observe two insertions and one substitution, which corresponds to their Levenshtein distance of 3.
]

#item("Algorithm")[The Needleman–Wunsch algorithm][
uses dynamic programming to compute the optimal alignment between two strings.
]

#dev[
#item("Algorithm")[Hirschberg's algorithm @GUS[12.1.2]][is an improvement over the Needleman-Wunsch algorithm using a divide-and-conquer approach on top of dynamic programming.]
]

#item("Application")[][String alignment is an important problem in bioinformatics for the sequencing and comparison of DNA sequences.]

#dev[
  #item("Application")[@CRO[8.2] Fuzzy string matching][finds factors in a string $w$ with an edit distance of at most $k$ to a pattern $p$.]
  #item("Algorithm")[Sellers' algorithm][, based on dynamic programming, can compute a fuzzy string matching in $cal(O)(|w|.|p|)$.]
]
#item("Program")[`fzf`][is a command-line tool allowing fuzzy string matching.]

#item("Practical use")[][We must sometimes be contempt with an *approximation* of an optimal alignment. Tools such as BLAST allow the alignment of DNA strands efficiently using various heuristics, but sacrificing the guarantee of optimality.]

== Compression
#item("Motivation")[][In order to reduce the size of a file, we seek to encode repeating patterns in a more efficient manner.]

#item("Definition")[A binary encoding][is a function $phi: Sigma^* without {epsilon} -> {0, 1}^+$. A *fixed-width* code maps each symbol to a word of fixed size $k$. Otherwise, it is a *variable-width* code.]

#item("Definition")[The encoding][of a string $w in Sigma^* without {epsilon}$ is $phi(w)$. $"Im"(phi)$ is the _set_ of code derived from $phi$.]

#item("Example")[ASCII code][is a fixed-width encoding of characters using 8 bits.]

#item("Definition")[The compression rate][of $w$ given a binary encoding $phi: {0, 1}^+ -> {0, 1}^+$ is $(|phi(w)|) / (|w|)$.]
#item("Definition")[An encoding $phi$ is *lossless*][if $phi$ has an inverse function $phi^(-1)$. This is the *decoding function*. The decoded data is then the same as the data before encoding.]

=== Huffman code @TOR[9.5.2.1]

#item("Intuition")[][We want to encode frequent characters using shorter codes.]

#item("Definition")[$phi$ is a prefix code][if no code derived from $phi$ is a prefix of another code from $phi$. It follows that $phi$ has an inverse.]

#item("Definition")[A binary prefix tree][maps each symbol with a path that reaches it from the root.]

#item("Algorithm")[Huffman's algorithm][
computes, given the frequency of a set of symbols, a binary prefix tree with the property of mapping frequent symbols to shorter paths.

We then derive the Huffman code from this tree. When following a path from the root to a symbol, taking the left branch appends a 0 to our code, while taking the right branch appends a 1.
]

#item("Theorem")[The Huffman code is optimal][
  as it minimizes the value $S = Sigma f_(i) d_(i)$ where $d_(i)$ is the depth of the symbol $c_(i)$ in the tree (and therefore its encoded length) and $f_i$ is its frequency.
]

#item("Complexity")[][
Huffman's algorithm has a worst-case time complexity of $cal(O)(|w| log(|w|))$ when encoding a string $w$.
]

=== The Lempel-Ziv-Welch (LZW) algorithm @TOR[9.5.2.2]

#item("Intuition")[][
Encode repeating factors in a compact form, rather than individual symbols.
]

#item("Algorithm")[][
The LZW algorithm uses a dictionnary, mapping factors of a string to codes. This dictionnary is encoded as a prefix tree.
]
#item("Example")[@TOR[p554]][
#align(center, image("image.png"))
]

#item("Note")[Decoding][
The dictionnary storing the codes does not need to be transmitted, it can be computed on-the-fly while decoding.
]

#item("Note")[The LZW algorithm works in a single pass][, making it ideal for large ammounts of data or streaming applications.]

#item("Application")[The ZIP archive format][is often implemented using an algorithm called DEFLATE, which combines a variant of LZW as well as Huffman coding.]

#item("Related concepts")[Lossy compression][
The algorithms presented here are all lossless. When encoding sound, images or video data, a tradeoff can be made: data that is not noticeable by the end user can be discarded in order to obtain a better compression rate. This is the case of formats such as MP3 or JPEG.
]

#recap()

#bibliography(read("../bib.yaml", encoding: none))

#align(bottom + center)[
  Alois Rautureau - Alexis Hamon
]
