# Sunday, October 15, 2013

## Finding fonts in a pdf

Use `strings`, then search for `FontName`, `FontDescriptor`, or `BaseFont`. The
first may suffice.

This [SO answer](http://stackoverflow.com/q/3488042/2121468) also looks
promising.

## `strings`

Finds the printable strings in a binary!

I guess the heuristic it uses is "A string is any sequence of 4 (the default)
or more printing characters ending with a newline or a null."
