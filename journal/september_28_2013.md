# Saturday, September 8, 2013

## Deriving `Applicative`

Really interesting [answer](http://stackoverflow.com/a/18861310/383958) from
SO.

There is at most one instance of `Functor` for a given data type that follows
the functor laws. For example, `map` is the only lawful implementation of
`fmap` for lists:

> fmap id      == id
> fmap (f . g) == fmap f . fmap g

But there can be more than one law-abiding instance of `Applicative`, which
isn’t necessarily obvious.

> pure id <*> v              == v
> pure (.) <*> u <*> v <*> w == u <*> (v <*> w)
> pure f <*> pure x          == pure (f x)
> u <*> pure y               == pure ($ y) <*> u

For lists, `<*>` can behave like `\fs xs -> concatMap (\f -> map f xs) fs` or
like `zipWith ($)`, and it isn’t clear which one the compiler should choose.
