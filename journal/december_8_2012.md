# Saturday, December 8, 2012

## 10:06 AM - generalized bananas, lenses, and barbed wire

http://hackage.haskell.org/package/recursion-schemes

## 11:44 AM - new typeable

    class Typeable a where
        typeOf :: a -> TypeRep

    class Typeable1 t where
        typeOf1 :: t a -> TypeRep

    class Typeable2 t where
        typeOf2 :: t a b -> TypeRep

    ...

is being replaced by

    data Proxy (t :: k) = Proxy

    class Typeable (a :: k) where
        typeRep :: Proxy (a :: k) -> TypeRep

    # backwards-compatibility
    typeOf :: forall a. Typeable a => a -> TypeRep
    typeOf _ = typeRep (Proxy :: Proxy a)

    typeOf1 :: forall t (a :: *). Typeable t => t a -> TypeRep
    typeOf1 _ = typeRep (Proxy :: Proxy t)

    typeOf2 :: forall t (a :: *) (b :: *). Typeable t => t a b -> TypeRep
    typeOf2 _ = typeRep (Proxy :: Proxy t)

"a single, poly-kinded instance to deal with type application":

    instance (Typeable s, Typeable a) => Typeable (s a) where
        typeRep _ = typeRep (Proxy :: Proxy s) `mkAppTy` typeRep (Proxy :: Proxy a)

## 12:26 PM - proving a function unique for its type

Example - `id :: a -> a` is unique.

Given any ADT (basically, given any data type in Haskell), for instance

    data Nat = Zero | Succ Nat

there exists an indexed family (GADT), for example:

    data SNat n where
        SZero :: SNat Zero
        SSucc :: SNat n -> SNat (Succ n)

And we can give `SNat` the same semantics as `Nat` by erasing all the types to
an untyped language such that `Nat` and `SNat` erase to the same thing. What
we've done here is given each inhabitant of `Nat` a unique type. Then

    id (x :: SNat n) :: SNat n

`Snat n` has only one inhabitant and since the semantics is given by erasure,
`id` can't use the type of its argument, so the only value returnable from `id`
on any `Nat` is the same value put in.

Since there is only one way to construct `id`, it is unique.

I'll probably end up having to read [Theorems for Free](/files/wadler.pdf).

## 12:37 PM - Homotopy Type Theory

* Constructivity - Proofs of propositions are mathematical objects classified
  by their types.
* Homotopy - Paths between objects of a type are proofs of their
  interchangeability in all contexts. Paths in a type form a type whose paths
  are homotopies (deformations of paths).

> Higher inductive types allow one to define types by specifying their
> elements, any paths between their elements, any paths between those paths,
> and so on to any level, or dimension.
