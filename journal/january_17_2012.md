# Thursday, January 17, 2012

## 11:24 AM - PEP 380 and 342

Ndb relies heavily on PEP 342, which redefined `yield` from a statement to an
expression.

`send` is defined as a method for generator-iterators, which "resumes the
generator and 'sends' a value that becomes the result of the current
yield-expression. The send() method returns the next value yielded by the
generator, or raises StopIteration if the generator exits without yielding
another value." See it in use in `_help_tasklet_along`.

Similarly, `throw` is a method for generator-iterators which "raises an
exception at the point where the generator was paused, and which returns the
next value yielded by the generator, raising StopIteration if the generator
exits without yielding another value." See it in use in `_help_tasklet_along`.

`close` is also a method for generator-iterators, "which raises GeneratorExit
at the point where the generator was paused." This basically shuts down the
iterator (and is called when it's garbage collected) but not used in ndb so I
don't particularly care.

## 12:07 PM - Don't use a generator within a tasklet

Actually, you can use a generator, but don't yield the results of one. You'll
get an error "Cannot defer to another generator." without your code in the
traceback.

## 5:30 PM - Consistency with db and ndb

Using db you can `db.get(key)` to enforce strong consistency when testing.
That's not the case with ndb, you need to use
`self.set_consistency_probability(1)`.
