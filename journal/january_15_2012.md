# Tuesday, January 15, 2012

## 11:06 AM - don't ever use `type`

[Alex Martelli says](http://stackoverflow.com/a/1549854) to basically never use
`type`. Even `isinstance` and `issubclass` are somewhat discouraged compared to
duck typing paired with `try`/`except`.

## 12:32 PM - ndb notes

You can yield a `UserRPC` or `MultiRpc` - this is great news! Unfortunately you
can't yield it at the same time as a `Future`, because when you yield a tuple
or list ndb sticks everything in a a `MultiFuture` without checking the type.
Example:

    # This will fail
    db_result, ndb_result = yield get_db_async(), get_ndb_async()

    # So create a tasklet that yields the `UserRPC`
    @ndb.tasklet
    def get_db_async_tasklet():
        db_result = yield get_db_async()
        raise ndb.Return(db_result)

    db_result, ndb_result = yield get_db_async_tasklet(), get_ndb_async()

It's not too difficult to create an `ndb.Future` from a `UserRPC` or
`MultiRpc`, so it's fine if your interface expects an `ndb.Future`, though
remember you can still yield an old async.

    def rpc_to_future(rpc):
        """Create an ndb.Future from a UserRPC or MultiRpc (old async).

        The ndb Future interface seamlessly supports old asyncs - see
        tasklets.py, lines 415 - 419.
        """
        future = ndb.Future()
        future.set_result(rpc)
        return future

Also, this comment from the code (not the docs).

> As a special feature, if the wrapped function is not a generator function,
> its return value is returned via the Future.  This makes the following two
> equivalent:

    @tasklet
    def foo():
      return 42
  
    @tasklet
    def foo():
      if False: yield  # The presence of 'yield' makes foo a generator
      raise Return(42)  # Or, after PEP 380, return 42

> This feature (inspired by Monocle) is handy in case you are implementing an
> interface that expects tasklets but you have no need to suspend -- there's no
> need to insert a dummy yield in order to make the tasklet into a generator.

The `Future` constructor takes an optional argument, `info`, describing the
purpose of the future.

These two are not equivalent, though I'm not sure exactly how they differ:

    # option 1
    @ndb.tasklet
    def get_feedback():
        feedback = yield feedback_key.get_async()
        raise ndb.Return(feedback)
    feedback, responses = yield get_feedback(), get_responses()

    # option 2
    feedback, responses = yield (rpc_to_future(feedback_key.get_async()),
        get_responses())

## 4:46 PM - When lint for a rebase fails

When lint for a rebase fails don't use `hg commit --amend`, use `hg rebase
--continue`.
