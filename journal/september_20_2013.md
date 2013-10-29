# Friday, September 20, 2013

## Add ALL the Things

Abelian groups for analytics. I guess you would use `Monoid` in haskell.

Important properties - combination operation, associativity, commutativity,
identity. A commutative monoid.

`TopK`, `Average` monoids.

    public interface Aggregator<I, O, S> {
        S initial();
        S prepare(I input);
        S reduce(S left, S right);
        O present(S result);
    }

    class Aggregator i o s where
        initial :: s
        prepare :: i -> s
        reduce :: s -> s -> s
        present :: s -> o

Unique values monoid. Hash all the input values, keep the first n hashes.
HyperLogLog for unique values, min-hash for set similarity, bloom filters for
set membership.

Frequency monoid. Count-min sketch. Use multiple vectors, each with a different
hash function. Take the min of all hash positions.

## Programming a 144-core Chip

Chuck Moore - created Forth 45 years ago.

18 bits / word, 4 inst/word, 64 word ram, 5 ns access.

Common to forth computers - two pushdown stacks - one return stack, one
parameter stack.

## Scala vs. Idris

Idris wins.

## Chris Granger

Programming is:

* unobservable
* indirect
* incidentally complex

Claim: programming is data transformation and nothing else.
