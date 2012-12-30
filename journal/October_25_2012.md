# October 25, 2012

## 2:31 PM revset tricks

`x::y` - all changesets that are descendents of x and ancestors of y, including
x and y. The first endpoint is by default `ancestors(y)`, the second is
`descendants(x)`. Alternatively `x..y`.

`x:y` - All changesets with revision numbers between x and y, inclusive.
Defaults 0 and tip.

`x and y` = `x & y`
`x or y` = `x | y` = `x + y`
`x - y`
`x^n` - then nth parent of x
`x~n` - the nth first ancestor of x; `x~0` = `x`, `x~3` = `x^^^`

## 3:52 PM - javascript RegExp modifiers

`/i` - case insensitive
`/s` - single line mode, dot matches newlines
`/m` - multi line mode - caret and dollar match before and after newlines
`/x` - free spacing mode - whitespace between tokens is ignored, # starts a
comment
`/g` - global matching (replaces all matches instead of just first)
