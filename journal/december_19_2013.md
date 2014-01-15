# Thursday, December 19, 2013

## Impredicative Polymorphism

> A definition (of a set, a type, etc.) is called "impredicative" if it
> involves a quantifier whose domain includes the very thing being defined.

ML has predicative (or stratified) polymorphism because the type variables are
restricted to monotypes which do not contain quantifiers.

"predicative" and "impredicative" come from logic. Russell banished
impredicative set membership conditions which could refer to themselves and
thus lead to Russell's paradox.
