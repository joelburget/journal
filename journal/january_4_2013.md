# Saturday, January 4, 2013

## Lens operator tricks

1. Operators that begin with ^ are kinds of views. The only example we've seen
   so far is (^.) which is... well, it's just view exactly.
2. Operators that end with ~ are like over or set. In fact, (.~) == set and
   (%~) is over.
3. Operators that have . in them are usually somehow "basic"
4. Operators that have % in them usually take functions
5. Operators that have = in them are just like their cousins where = is
   replaced by ~, but instead of taking the whole object as an argument, they
   apply their modifications in a State monad.

from https://www.fpcomplete.com/school/to-infinity-and-beyond/pick-of-the-week/a-little-lens-starter-tutorial

## Python 3

[Lotsa cool stuff](https://speakerdeck.com/pyconslides/python-3-dot-3-trust-me-its-better-than-python-2-dot-7-by-dr-brett-cannon)
