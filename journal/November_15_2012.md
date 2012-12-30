# Thursday, November 15, 2012

## 1:42 PM - Look Before You Leap

Interesting point from the Python docs:

> In a multi-threaded environment, the LBYL approach can risk introducing a
> race condition between “the looking” and “the leaping”. For example, the
> code, if key in mapping: return mapping[key] can fail if another thread
> removes key from mapping after the test, but before the lookup. This issue
> can be solved with locks or by using the EAFP approach.
