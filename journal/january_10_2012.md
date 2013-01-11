# Thursday, January 10, 2012

## 2:54 PM - `itertools.tee`

> Return n independent iterators from a single iterable.

## 2:56 PM - *iterator* vs *iterable*

> An iterable is an object that has an `__iter__` method which returns an
> iterator, or which defines a `__getitem__` method that can take sequential
> indexes starting from zero (and raises an `IndexError` when the indexes are
> no longer valid). So an iterable is an object that you can get an iterator
> from.

> An iterator is an object with a `next` (Python 2) or `__next__` (Python 3)
> method.

## 3:31 PM - Flask's `request`

It turns out the `request` object in Flask is not a magic local variable
introduced by Flask, instead it's a global whose import I had never noticed
before.

It's apparently threadsafe by being a proxy to an object local to the context.

> Imagine the context being the handling thread. A request comes in and the web
> server decides to spawn a new thread (or something else, the underlying
> object is capable of dealing with concurrency systems other than threads).
> When Flask starts its internal request handling it figures out that the
> current thread is the active context and binds the current application and
> the WSGI environments to that context (thread). It does that in an
> intelligent way so that one application can invoke another application
> without breaking.

## 4:40 PM - Numpy problems on OS X 10.8

> Latest Numpy compiles fine in Clang but occasionally segfaults. App Engine
> version of Numpy doesn't compile.

> If you experience very strange test failures on a Mac, reinstall Numpy with
> `CC=gcc`.
