# Thursday, December 27, 2012

## 12:36 PM - Natural Transformation

> A natural transformation between functors `L,M : C -> D` is a family of morphisms `hX`, one for each object `X` in `C`, such that for any morphism `k : X -> Y` in `C` we have `hY o Lk = Mk o hX`.

If we're talking about f, for all functions `g :: x -> y, f_y . fmap (fmap g) =
fmap g . f_x` 

Covariant / Contravariant
-------------------------

Terms for functors. A covariant functor is normal, a contravariant functor reverses the order of composition. Cofunctor = Contravariant Functor.

Covariant: fmap (f . g) = fmap f . fmap g
Contravariant: fmap (f . g) = fmap g . fmap f

March 2, 2013 Edit:

Spivak, Differential Geometry, Volume 1

Nowadays such situations are always distinguished by calling the things which
go in the same direction “covariant” and the things which go in the opposite
direction “contravariant.” Classical terminology used these same words, and it
just happens to have reversed this: a vector field is called a contravariant
vector field, while a section of T*M is called a covariant vector field. And no
one had the gall or authority to reverse terminology sanctified by years of
usage. So it’s very easy to remember which kind of vector field is covariant,
and which is contravariant — it’s just the opposite of what it logically ought
to be.
