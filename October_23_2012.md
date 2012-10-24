# Tuesday, October 23, 2012

## 8:54 PM

Kleisli arrow:

    newtype Kleisli m a b = Kleisli {runKleisli :: a -> m b}

`(=<<) :: (a -> m b) -> (m a -> m b)` - Kleisli arrow to arrow

`extract :: (w b -> a) -> w b -> w a` - the dual

`(>>=) :: m a -> (a -> m b) -> m b` - breaks the arrow in half

    data Dual k a b = Dual (k b a)

    instance Category (->) => Category (Dual (->)) where
        id = Dual id
        Dual f . Dual g = Dual (g . f)

Cofunctor = Functor!

    class ContravariantFunctor f where
        contrafmap :: (b -> a) -> (f a -> f b)

    newtype Test a = Test {runTest :: a -> Bool}
    instance ContravariantFunctor Test where
        contrafmap f (Test g) = Test (g . f)

    isZero :: Test Int
    isZero = Test (== 0)

    isEmpty :: Test [a]
    isEmpty = contrafmap length isZero

    result :: Bool
    result = runTest isEmpty "Hello"
