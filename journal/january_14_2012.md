# Monday, January 14, 2012

## Positional Argument Decorator

A decorator from the App Engine source:

    def positional(max_pos_args):
      """A decorator to declare that only the first N arguments may be positional.
    
      Note that for methods, n includes 'self'.
      """
      __ndb_debug__ = 'SKIP'
      def positional_decorator(wrapped):
        if not DEBUG:
          return wrapped
        __ndb_debug__ = 'SKIP'
        @wrapping(wrapped)
        def positional_wrapper(*args, **kwds):
          __ndb_debug__ = 'SKIP'
          if len(args) > max_pos_args:
            plural_s = ''
            if max_pos_args != 1:
              plural_s = 's'
            raise TypeError(
              '%s() takes at most %d positional argument%s (%d given)' %
              (wrapped.__name__, max_pos_args, plural_s, len(args)))
          return wrapped(*args, **kwds)
        return positional_wrapper
      return positional_decorator

Notice the `__ndb_debug__ = 'SKIP'` lines - those tell the following stack
printer to ignore them.

    def get_stack(limit=10):
      # Return a list of strings showing where the current frame was called.
      if not DEBUG:
        return ()
      frame = sys._getframe(1)  # Always skip get_stack() itself.
      lines = []
      while len(lines) < limit and frame is not None:
        f_locals = frame.f_locals
        ndb_debug = f_locals.get('__ndb_debug__')
        if ndb_debug != 'SKIP':
          line = frame_info(frame)
          if ndb_debug is not None:
            line += ' # ' + str(ndb_debug)
          lines.append(line)
        frame = frame.f_back
      return lines

## 11:24 AM - Entity size

* db - `len(db.model_to_protobuf(entity).Encode())`
* ndb - `len(entity._to_pb().Encode())`

## 3:43 PM - ndb's `Return` is just `StopIteration`

## 6:11 PM - `ndb.Return` can take a tuple as args

    # You can do this
    raise ndb.Return(x, y)
    # instead of this
    raise ndb.Return((x, y))

... as implemented in `google.appengine.ext.ndb.get_return_value`

## 7:39 PM - The S and K combinators form a complete basis

k x y = x
s x y z = x z (y z)

And so is the X combinator (by itself!)
x y = (y s) k
