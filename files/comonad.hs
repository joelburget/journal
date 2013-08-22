{-# LANGUAGE RankNTypes, DeriveFunctor #-}

import Control.Applicative
import Control.Comonad
import Data.Functor.Identity
import Data.Monoid

-- encodes both a default `s` and a function `s -> a`
-- alternative store
newtype Pretext s a = Pretext {
    runPretext :: forall f. Functor f => (s -> f s) -> f a
  } deriving Functor

experiment :: Functor f => (s -> f s) -> Pretext s a -> f a
experiment f (Pretext k) = k f

instance Comonad (Pretext s) where
    -- extract :: Pretext s a -> a
    extract ptx = runIdentity $ runPretext ptx Identity

    -- duplicate :: Pretext s a -> Pretext s (Pretext s a)
    duplicate ptx = Pretext $ \f -> fmap (const ptx) (f undefined)

    -- extend :: (Pretext s a -> b) -> Pretext s a -> Pretext s b
    extend extricate ptx = Pretext $ \f ->
        fmap (const (extricate ptx)) (f undefined)

fmapPretext :: (a -> b) -> a -> Pretext a b
fmapPretext f a = Pretext $ \f2 -> f `fmap` f2 a

defaultPretext :: a -> Pretext a a
defaultPretext a = Pretext ($ a)

monoidPretext :: Monoid m => Pretext m m
monoidPretext = defaultPretext mempty

newtype Bazaar s a = Bazaar {
    runBazaar :: forall f. Applicative f => (s -> f s) -> f a
  } deriving Functor

instance Applicative (Bazaar s) where
    pure x = Bazaar $ const $ pure x

    b1 <*> b2 = Bazaar $ \f -> (runBazaar b1 f) <*> (runBazaar b2 f)

instance Comonad (Bazaar s) where
    extract bzr = runIdentity $ runBazaar bzr Identity

    duplicate bzr = Bazaar $ \f -> fmap (const bzr) (f undefined)

    extend extricate bzr = Bazaar $ \f ->
        fmap (const (extricate bzr)) (f undefined)


-- "A non-regular data type challenge"
-- http://twanvl.nl/blog/haskell/non-regular1

-- Non-regular datatype
-- List of all the inputs to a function a^n -> b
-- i.e. b or a -> b or a -> a -> b, etc
data FunList s a
    = Done a
    | More s (FunList s (s -> a))
    deriving Functor

-- Extract the return value by applying all the inputs
getB :: FunList a b -> b
getB (Done b)   = b
getB (More a z) = getB z a

-- Get the list of inputs
getAs :: FunList a b -> [a]
getAs (Done _)   = []
getAs (More a z) = a : getAs z

instance Applicative (FunList s) where
    pure = Done

    -- FunList (a -> b) -> FunList a -> FunList b
    (Done f) <*> fl = f `fmap` fl
    More a z <*> c = More a (flip <$> z <*> c)
    -- ffl <*> fl = Done $ (getB ffl) (getB fl)
