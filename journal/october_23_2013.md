# Wednesday, October 23, 2013

## `function(undefined)` and `function(window)`

Why do people take `undefined` and `window` as parameters?

So they can be minified! This seems like a job for a tool, not the programmer,
but I digress. The `undefined` thing also protects you from other people
assigning it to something not-undefined, which I guess could be a problem.
