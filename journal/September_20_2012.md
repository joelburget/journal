# Thursday, September 20, 2012

## 2:17 PM

I always forget how to use vim registers

`"kyy` - yank into the k register
`"Kyy` - append in to the register
`"kp` - paste from k
`:reg` - access all currently defined registers

The `0` register holds your last *yanked* text, *not* deleted.
