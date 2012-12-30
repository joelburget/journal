# Thursday, September 27, 2012

## 2:14 PM Found some combinators in underscore!

`_.once(function)` - creates a version of the function that can only be called
once.

`_.after(count, function)` - creates a version of the function that will only
be run after first being called `count` times.

`_.wrap(function, wrapper)` - wraps `function` inside of `wrapper`, passing it
as the first argument.

`_.compose(*functions)` - returns the composition of a list of functions, where
each consumes the return value of the function that follows.

Underscore also provides a facility for partial application, though it's kind
of hidden - `_.bind(function, object, [*arguments])`.
