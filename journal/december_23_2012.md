# Sunday, December 23, 2012

## 6:43 PM - initial vs final algebra

## 7:44 PM

> The rule for primitive corecursion on codata is the dual to that for
> primitive recursion on data. Instead of descending on the argument, we ascend
> on the result.

> Notice that corecursion creates (potentially inﬁnite) codata, whereas
> ordinary recursion analyses (necessarily ﬁnite) data. Ordinary recursion is
> not legal over codata, because it might not terminate. Conversely corecursion
> is not legal if the result type is data, because data must be ﬁnite.

## 8:39 PM - structural recursion limitation

The compiler can't tell that n-2 is valid structural recursion, only n-1.
