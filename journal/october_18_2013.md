# Friday, October 18, 2013

## LLVM vs libjit

Eli Bendersky started writing a [series](http://eli.thegreenplace.net/2013/10/17/getting-started-with-libjit-part-1/) on [libjit](http://www.gnu.org/software/libjit/doc/libjit.html).

So should I use libjit or LLVM? This
[article](https://code.google.com/p/libjit-linear-scan-register-allocator/wiki/LLVM_and_GNU_Lightning)
undermines its credibility in several ways:
* poor english
* mentioning ecma 335 but not mentioning what that is (standardized .NET CLR)
* weasel words
* being from 2009 and referencing a thread from 2004

Seriously, such a bad article. I can't see through the vitriol.

There is a [VMKit](http://vmkit.llvm.org/) project, "a substrate for virtual
machines", which relies on [MMTk](http://jikesrvm.org/MMTk), the memory manager
toolkit. WHY DOES THIS REQUIRE JAVA?

It's always hard to tell whether these projects could be adaped to a lazy
functional language or whether they're only suitable for (a subset of)
imperative languages.
