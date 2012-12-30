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
