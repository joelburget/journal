# February 16, 2013

## 8:36 AM - Control.Lens.Level

`Level i a` is a "path-compressed copy of one level of a source data
structure". In other words, a patricia trie. `i` is apparently a key but is
not always used.

    data Level i a
    = Two {-# UNPACK #-} !Word !(Level i a) !(Level i a)
    | One i a
    | Zero
    deriving (Eq,Ord,Show,Read)

Now we can explain the results from yesterday. `levels` performs a
"breadth-first `Traversal` of the individual `levels` of any other
`Traversal`" (via iterative deepening depth-first search(!)).

    > ["hello","aristid"]^..Lens.levels (traverse.traverse).traverse
    "healrliostid"

We can see the level information:

     > ["hello", "aristid"]^..ilevels (traversed.traversed)
     [Zero,Zero,One 0 'h',Two 0 (One 1 'e') (One 0 'a'),Two 0 (One 2 'l') (One 1 'r'),Two 0 (One 3 'l') (One 2 'i'),Two 0 (One 4 'o') (One 3 's'),One 4 't',One 5 'i',One 6 'd']

I don't know where the `Zero`s come from... In fact that whole structure seems
a bit suspect. Let's investigate a bit more.

    > ["hello", "aristid"]^..levels traverse
    [Zero,One () "hello",One () "aristid"]

Now it makes sense. `Zero` must be the root and calling `traverse.traverse`
make a trie from a trie. Well, some sense at least.
