# Thursday, August 8, 2013

## Natural Transformations

Been reading [de Bruijn notation as a nested datatype](/files/debruijn_as_nested_datatype.pdf) (to figure out how to implement an alternative to bound that doesn't require the language to be embedded (or to figure out that I can use bound)) and I think I finally get what a natural transformation is.

A function `f :: M a -> N a` is called a *natural transformation*. It "may be
viewed as a collection of functions, one for each instantiation of the type
variable `a`. Because `f` is polymorphic, i.e. defined independently of `a`,
these instances are related by the following naturality condition:"

    fmap k . f = f . fmap k

"for all functions `k`".

Sweet! So `f` works on the elements in some polymorphic container and it can be
commmuted with another function working on those elements.

    x :: M a

    f x :: N a
    (fmap k . f) x :: N b

    (fmap k) x :: M b
    (f . fmap k) :: N b
