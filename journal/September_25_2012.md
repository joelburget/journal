# Tuesday, September 25, 2012

## 5:13 PM underscore's `include`, `invoke`

`_(list).include(value)` returns true if `value` is in `list`, using `===`.

`_(list).invoke(methodName, [*arguments])` calls the method named by
`methodName` on each value in `list`, with `arguments` passed to each
invocation. How is this different than `map`? `methodName` is a name not a
method.
