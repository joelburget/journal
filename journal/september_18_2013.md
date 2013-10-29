# Wednesday, September 18, 2013

## Strange Loop Emerging Languages Camp

### Gershwin - "Stack-based Concatenative Clojure".

It seems to me the main innovation here is the integration of a stack based
language with Clojure. It uses an extension to the base language using the
"reader macro". I don't think this offers anything over forth or factor other
than the rest of Clojure (which is a big thing). Stack-based languages are
still hard to read.

### [Daimio](daimio.org) - "a language for sharing".

You can't extend web applications. Allowing users to extend with js sucks hard
- not secure or safe (too big). Dataflow programming. Lambdas look like strings
- whoa.

> (lamba example here)

The creator has spent a lot of time thinking about making interaction easy and
making parts of your application selectively accessible/safe.

### Babel - "An Untyped, Stack-based HLL"

A language with a large set of security primitives. HLL = "high-level
language". Stack based, not pure, untyped. It's entirely unclear to me what the
big idea is.

### Noether - "Symmetry in Programming Language Design"

The hypothesis is that symetry is a very good thing - language features that
break symmetry may be misfeatures. Side effect, failure handling, and
concurrency are necessary but break symmetry.

Stratified languages allow "the strongest symmetries possible for any given
expressiveness".

### Dao - "Programming Language for Scripting and Computing"

Motivated by frustration with perl and desire for a better bioinformatics
language.

### [Axiomatic Language](http://axiomaticlanguage.org/)

Specifies by enumeration - provide an infinite set of expressions to specify
programs.

### The J Programming Language

[Tracy Harris](http://kaleidic.com/)

### [Enso](http://enso-lang.org/) - Composing DSL Interpreters, Langs, & Aspects


## [Embedding Foreign Code](/files/acc-ffi.pdf)

Great use of quasiquotation for embed cuda code in Haskell.
