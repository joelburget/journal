# Saturday, November 17, 2012

## The naming problem

Maybe this'll come in handy sometime [Making de Bruijn Succ Less](http://www.slideshare.net/ekmett/bound-making-de-bruijn-succ-less) - [the bound package](hackage)

## `window.location`

* `window.location.replace(url)` - replace the url in the address bar
* `window.location = url` - redirect to a page

## 5:48 PM - `static`

Apparently `static` has meanings I didn't know about

1. (file scope): makes symbols have internal linkage
2. (block scope): gives objects static storage
3. (C++ only): associates class members with the class itself (rather than
   objects of this class)
4. (C99 only): in function parameters: tells the compiler it may assume the
   pointer points to at least the given number of elements
