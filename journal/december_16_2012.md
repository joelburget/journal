# Sunday, December 16, 2012

## 8:35 AM - totality

From the Idris tutorial, not sure if this is the set of rules in general:

To be recorded as total, a function `f` must:
* Cover all possible inputs
* Be *well-founded* — i.e. by the time a sequence of (possibly mutually)
  recursive calls reaches `f` again, it must be possible to show that one its
  has
  decreased.
* Not use any data types which are not *strictly positive*
* Not call any non-total functions

## 6:38 PM - `git rerere`

This is a real command. Allows you to reuse merge conflict resolutions.
