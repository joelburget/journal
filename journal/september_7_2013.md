# Saturday, September 7, 2013

## Higher-kinded polymorphism and unification

> Type inference for a system involving higher kinds seems at first to require
> higher-order unification, which is both much harder than traditional
> first-order unification and lacks most general unifiers (Huet, 1975).
> However, by treating higher-kinded type constructors as uninterpreted
> functions and not allowing lambda at the type level, Jones’s paper (Jones,
> 1993) shows that ordinary first-order unification suffices. The solution is a
> little ad hoc—for example, the order of type parameters in a data-type
> declaration can matter— but it has an excellent power-to-weight ratio. In
> retrospect, higherkinded quantification is a simple, elegant, and useful
> generalisation of the conventional Hindley-Milner typing discipline (Milner,
> 1978). All this was solidified into the Haskell 1.3 Report, which was
> published in 1996.

From [A History of Haskell: Being Lazy With Class](/files/haskellhistory.pdf).
