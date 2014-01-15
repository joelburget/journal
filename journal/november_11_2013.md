# Monday, November 11, 2013

## Template Haskell

> A splice can occur in place of
>
> * an expression; the spliced expression must have type Q Exp
> * a type; the spliced expression must have type Q Typ
> * a list of top-level declarations; the spliced expression must have type Q
>   [Dec]

So you can't splice in, for instance, constructor names.
