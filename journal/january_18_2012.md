# Friday, January 18, 2012

## 11:04 AM - contextlib

"Utilities for `with`-statement contexts"

`contextmanager` - you don't need to create a class or separate `__enter__` and
`__exit__` methods to create a context manager. The function decorated must
yield exactly once and if a value is yielded it will be bound to the targets in
the `with` statement's `as` clause.

    @contextmanager
    def tag(name):
        print "<%s>" % name
        yield
        print "</%s>" % name

    >>> with tag("h1"):
    ...    print "foo"
    ...
    <h1>
    foo
    </h1>

`nested` - deprecated

`closing` - "Return a context manager that closes thing upon completion of the
block."

    with closing(urllib.urlopen('http://www.python.org')) as page:
        for line in page:
            print line

## 8:21 PM - [Hindley-Milner in Python](/files/hindley_milner.py)
