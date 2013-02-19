# Sunday, February 10, 2013

## 11:56 AM - Haskell indentation

> After the keyword 'let', the position of the start of the next
> significant token (not whitespace or comments), sets a new indentation
> level. The definiton begun there extends until
> - a line indented less or equally far is encountered
> - the keyword 'in' appears
> - an explicit semicolon ends the definition
> If a line indented less appears before the keyword 'in', a parse error
> results.

The fact that the start of the next token starts a new indentation level
just bit me.
