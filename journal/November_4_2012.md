# Sunday, November 4, 2012

## 8:57 AM - Records, sums, cases, and exceptions: Row-polymorphism at work

[Talk](http://research.microsoft.com/apps/video/dl.aspx?id=104004)

### Record Polymorphism

    fun succ_a r = 1 + r.a
    val succ_a : forall a : {a : int}.a -> int

### Row Polymorphism

    fun succ_a r = 1 + r.a
    val succ_a : forall alpha: {a}. {a : int, alpha} -> int

`alpha` represents a row of fields

Row polymorphism is extensible:

    fun aug_a r = {a = 1, ... = r}
    val aug_a : forall alpha. {a}. {alpha} -> {a : int, alpha}

* representing "slices" of records
* functional record update (polymorphic)
* named function parameters; partial application in arbitrary order; parameters
  with default values

### Polymorphic Sums and Extensible Records

The expression problem:
Datatypes: easy to add new functions, hard to add new cases
Classes: hard to add new functions, easy to add new cases

    datatype exp = Con of int
                 | Plus of exp * exp

    fun eval (Con i) = i
      | eval (Plus (e, e')) = eval e + eval e'

extending in both directions...

    datatype exp = Con of int
                 | Plus of exp * exp
                 | Minus of exp * exp

    fun eval (Con i) = i
      | eval (Plus (e, e')) = eval e + eval e'
      | eval (Minus (e, e')) = eval e - eval e'

    fun nops (Con i) = 0
      | nops (Plus (e, e')) = 1 + eval e + eval e'
      | nops (Minus (e, e')) = 1 + eval e + eval e'

Now MLPolyR

    fun eval_c eval =
        cases `Con i => i
            | `Plus (e, e') => eval e + eval e'

    fun eval e =
        match e with
            eval_c eval

And extend with `minus`, `nops`, and the intersection of the two.

    fun nops_c no =
        cases `Con i => 0
            | `Plus (e, e') => 1 + no e + no e'

    fun nops e = match e with (nops_c nops)


    fun eval_minus_c ev =
        cases `Minus (e, e') => ev e - ev e'

    fun eval_minus e = match e with (eval_minus_c eval_minus)


    fun nops_minus_c no =
        cases `Minus (e, e') => 1 + no e + no e'
        default: nops_c no

    fun nops_minus e = match e with (nops_minus_c nops_minus)

I guess the basic idea here is extending what you already have. You can "think
of each little function as a slice of a larger case expression and by
functional composition you can plug them all together into one large case."

So this doesn't solve the expression problem in any way...

## 11:57 AM - ompf

Apparently [ompf has moved](http://igad2.nhtv.nl/ompf2/), for the past year or
so I thought it was just down.

## 3:09 PM - homotopy type theory

Using notes from two places:
1. [Seminar on Homotype Type Theory
   (UCSD)](http://www.math.ucsd.edu/~mshulman/hottseminar2012/)
2. [Awodey's Type Theory and Homotopy](TTH.pdf)

Type Theory               | Category Theory
--------------------------+----------------
A: Type, B: Type          | objects
x: A ⊢ b: B               | Morphism A -> B
x_1: A_1, x_2: A_2 ⊢ b: B | Morphism A_1 x A_2 -> B
A x B: Type               | Categorical product
A + B: Type               | Categorical coproduct
A -> B: Type              | Categorical exponential

## 6:29 PM - unicode chars

Enter in vim with <c-v>uaaaa or <c-v>Ubbbbbbbb
turnstile ⊢ u22a2
arrows:
    * ←  u2190
    * ↑  u2191
    * →  u2192
    * ↓  u2193
    * ↔  u2194
    * ⇐  u21d0
    * ⇒  u21d2
    * ⇔  u21d4
    * ⇍  u21cd
    * ⇎  u21ce
    * ⇏  u21cf
http://en.wikipedia.org/wiki/Arrow_(symbol)
