# Monday, February 18, 2013

## 10:32 PM - Monad Transformers

It's easy to lift one of your submonads into the transformer stack:

    lift m :: t m a

But it's not easy to downgrade from the transformer stack to the base monad,
`m`. This happens when you need to use a function written for `m a` but you're
working in t m a. You need to downgrade the arguments and then upgrade the
result. Examples I wrote this weekend:

    newtype TermParser a = TermParser {
        runTermParser :: StateT Context (P.Parsec Text ()) a
        } deriving (Functor, Applicative, Monad, MonadState Context)
    
    runTP :: TermParser a -> Context -> P.Parsec Text () (a, Context)
    runTP = runStateT . runTermParser
    
    instance A.Alternative TermParser where
        -- double unwrap, single rewrap
        a <|> b = TermParser . StateT $ \s -> runTP a s P.<|> runTP b s
        empty = A.empty 

    -- single unwrap and wrap
    try :: TermParser a -> TermParser a
    try x = TermParser . StateT $ P.try . runStateT (runTermParser x)

Also [see here](http://ro-che.info/articles/2012-01-02-composing-monads.html).

## 10:40 PM - The Algebra of Algebraic Datatypes

Just so I don't misplace these links
http://chris-taylor.github.com/blog/2013/02/13/the-algebra-of-algebraic-data-types-part-iii/
http://news.ycombinator.com/item?id=5196708
