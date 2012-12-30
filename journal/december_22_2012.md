# Saturday, December 22, 2012

## 8:36 PM - types

* type erasure - The compile time process by which explici type annotations are
  removed from a program. Operational semantics that do not require programs to
  be accompanied by types are called type-erasure semantics, to be contrasted
  with type-passing semantics. The possibility of giving type-erasure semantics
  is a kind of abstraction principle, ensuring that the run-time execution of a
  program does not depend on type information. The reverse operation is called
  type inference.
* phase distinction - Strict division between types and terms.
* closed expression - ?
* guarded recursion - Recursive calls occur with a constructor. Recurse first,
  then use the constructor, whereas in structural recursion you deconstruct the
  argument then recurse.
* codata - Possibly infinite data. You can only use guarded recursion with
  codata and structural recursion with data.

  data                 | codata
  ------------------------------------------
  inductive            | coinductive
  finite objects       | infinite objects
  structural recursion | guarded recursion
  structural induction | guarded coinduction

  Functions are codata.

* evidence generation - The typing rules for GHC check evidence for equations.
  GHC's constraint solver tries to run your type-level programs, generating
  evidence that a given expression equals its normal form.

Hindley Milner
--------------
* terms vs types - We write terms and leave types to be inferred then erased.
* explicitly written things vs implicitly written things - "we can have more
  interesting types if we're willing to write them in a few places.", "we don't
  have to write type class dictionaries when we use overloaded functions, but
  those dictionaries are certainly present (or inlined) at run-time."
* presence at run-time vs erasure before run-time - "In dependently typed
  languages, we expect to erase more than just types at run-time, but (as with
  type classes) that some implicitly inferred values will not be erased. E.g.,
  vReplicate's numeric argument is often inferable from the type of the desired
  vector, but we still need to know it at run-time."
* non-dependent abstraction vs dependent quantification - "We're used to
  quantifying over type variables with the corresponding type abstraction and
  application happening silently and statically." - not quite sure what that
  means.

GHC Typing Rules
----------------

Dependent Type Myths
--------------------
* undecidable typechecking
* Turing incomplete
* no phase distinction - It's not clear why phase distinction is considered good.
* I don't consider this a myth, [Phase Distinctions In The Compilation Of
EPIGRAM](http://www.cs.st-andrews.ac.uk/~james/RESEARCH/epiphase-submitted.pdf)
claims there is a phase distinction in the compilation of a dependently typed
language, but it isn't a distinction between terms and types, it's between
values which are used at compile time only and values which are used at run
time. I suppose that's just as good, as we're removing the "metadata", the part
of the program that's not used for execution.
* no type erasure
* proofs everywhere - dependently typed programs needn't be proven correct. "indeed I usually take the presence of any proofs in my code as the cue to question my definitions." - Conor McBride

## 12:06 AM - [A formalization of GHC’s core language](http://typesandkinds.wordpress.com/2012/12/03/a-formalization-of-ghcs-core-language/)

(yes, I know this is not the same day)

Look in the ghc repo under docs/core-spec.
