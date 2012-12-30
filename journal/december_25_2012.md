# Tuesday, December 25, 2012

## 5:46 PM - Total Functional Programming

Restricted to provably terminating programs - not Turing complete.

## 5:48 PM - Strictly Positive

    Inductive Rec (A : Type) :=
      In : (Rec A -> A) -> Rec A.

      (* Error: Non strictly positive occurrence of "Rec" in "(Rec A -> A) -> Rec A". *)

What is a “non strictly positive occurrence”? It is reminiscent to “covariance” and “contravariance” from subtyping, but more stringent (it is strict, after all!) Essentially, a recursive occurrence of the type (e.g. `Rec`) may not occur to the left of a function arrow of a constructor argument. `newtype Rec a = In (Rec a)` would have been OK, but `Rec a -> a` is not. (`(Rec a -> a) -> a` is not OK either, despite Rec a being in a positive position.)

There are good reasons for rejecting such definitions. The most important of these is excluding the possibility of defining the Y Combinator (party poopers!) which would allow us to create a non-terminating term without explicitly using a fixpoint. This is not a big deal in Haskell (where non-termination abounds), but in a language for theorem proving, everything is expected to be terminating, since non-terminating terms are valid proofs (via the Curry-Howard isomorphism) for any proposition! Thus, adding a way to sneak in non-termination with the Y Combinator would make the type system very unsound. Additionally, there is a sense in which types that are non-strictly positive are “too big”, in that they do not have set theoretic interpretations (a set cannot contain its own powerset, which is essentially what `newtype Rec = In (Rec -> Bool)` claims).

To conclude, types like `newtype Rec a = In { out :: Rec a -> a }` look quite innocuous, but they’re actually quite nasty and should be used with some care.

## 7:00 PM - Extensional vs Intensional Type Theory

Extensional - Type checking is undecidable. "definitional (i.e., computational)
equality is not distinguished from propositional equality". "two functions are
equal, if there are equal pointwise or to put it differently, if
all observations about them agree".

Intensional - Type checking is decidable, complex representation of standard
mathematical concepts.
