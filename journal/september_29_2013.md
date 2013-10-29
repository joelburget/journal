# Sunday, September 29, 2013

## Bedrock

[Bedrock](http://plv.csail.mit.edu/bedrock/) might make an interesting backend
- it isn't automatically optimized in the way llvm is, but it has built in
higher-level features like pattern matching and sql-style loop construct and is
extensible. Also built by Adam Chlipala.

## `reflection`

The [on reflection
article](https://www.fpcomplete.com/user/thoughtpolice/using-reflection) has a
neat example using Edward Kmett's `reflection` and `constraints` libraries:

    newtype Lift (p :: * -> Constraint) (a :: *) (s :: *) = Lift { lower :: a }

    class ReifiableConstraint p where
        data Def (p :: * -> Constraint) (a :: *) :: *
        reifiedIns :: Reifies s (Def p a) :- p (Lift p a s)

    instance ReifiableConstraint Monoid where
        data Def Monoid a = Monoid { mappend_ :: a -> a -> a, mempty_ :: a }
        reifiedIns = Sub Dict

    instance Reifies s (Def Monoid a) => Monoid (Lift Monoid a s) where
        mappend a b        = Lift $ mappend_ (reflect a) (lower a) (lower b)
        mempty = a where a = Lift $ mempty_ (reflect a)

    using :: forall p a. ReifiableConstraint p => Def p a -> (p a => a) -> a
    using d m = reify d $ \(_ :: Proxy s) ->
        let replaceProof :: Reifies s (Def p a) :- p a
            replaceProof = trans proof reifiedIns
                where proof = unsafeCoerceConstraint :: p (Lift p a s) :- p a
        in m \\ replaceProof

    using (Monoid (+) 0) $ mempty <> 10 <> 12 -- evaluates to 22
    using (Monoid (*) 1) $ mempty <> 10 <> 12 -- evaluates to 120

Well the payoff is neat anyway.

`reify :: forall a r. a -> (forall (s :: *). Reifies s a => Proxy s -> r) -> r`
is pretty neat - it converts some value to a proxy and passes it to some
function that uses the proxy. Then you can get the value out with `reflect ::
proxy s -> a`.

`reify` uses the same rank-2 trick that `ST` uses, so that we can't leak a
reference to the `Proxy`!

Haskell is more a more often giving me the feeling that C++ used to give. This
kind of stuff is definitely brushing against the limits of the language. I
think I need to start working in a more expressive language. Probably Idris,
maybe Agda.

`constraints` also includes the neat `unsafeApplicative` and
`unsafeAlternative` to construct `Applicative` from `Monad` and `Alternative`
from `MonadPlus`. Plus `unsafeDerive` and `unsafeUnderive` to coerce
dictionaries between newtypes and base types.

## [Bitcoin is Worse is Better](http://www.gwern.net/Bitcoin%20is%20Worse%20is%20Better?2)

Though the hash chain is apparently quite a clever compromise.
