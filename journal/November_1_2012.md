# November 1, 2012

## 10:14 AM `synctasklet`

> `@ndb.synctasklet` is like `@ndb.tasklet` but altered to call `get_result()`
> on the tasklet. This turns your tasklet into a function that returns its
> result in the usual way.

A *tasklet* can run concurrently with other code and returns a `Future`.

To turn a function into an NDB tasklet:

* decorate the function with @ndb.tasklet,
* replace all synchronous datastore calls with yields of asynchronous datastore
  calls,
* make the function "return" its return value with raise ndb.Return(retval)
  (not necessary if the function doesn't return anything).

## 10:25 AM tasklets and stuff

1. If a function uses `yield` it should `ndb.tasklet`, `ndb.synctasklet`, or
   `ndb.toplevel`.
2. A function wrapped in `ndb.tasklet` returns a `Future` (and you can either
   `yield` it or call `get_result()` explicitly).
3. `ndb.synctasklet` is like wrapping it in `ndb.tasklet` but implicitly
   calling `get_result()`.
4. `ndb.toplevel` is just like `ndb.synctasklet` but also waits for all pending
   operations to complete.

I still don't understand this line:

> If you write a request function (a webapp2 request function, a Django view
> function, etc.) to be a tasklet, it won't do what you want: it yields but
> then stops running. In this situation, you want to decorate the function with
> `@ndb.synctasklet`.

## 4:45 PM App Engine internals

> App Engine stores index data in four Bigtables, shared across all apps. The
> first three tables store the built-in kind, single property ascending, and
> single property descending indexes. The last table stores all of the
> composite indexes.

- probably not useful, but interesting

I should watch this when I get a chance [Under the Covers of the Google App
Engine
Datastore](https://sites.google.com/site/io/under-the-covers-of-the-google-app-engine-datastore)
