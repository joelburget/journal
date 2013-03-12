# Wednesday, January 2, 2012

## 11:00 AM - Mercurial rebase

`--dest` / `-d`: Graft onto this changeset.

`--base` / `-b`: Rebase this down to its greatest common ancestor with `dest`,
onto `dest`.

`--source` / `-s`: Rebase this and its descendants onto `dest`.

`source` and `base` differ because `source` brings its *descendants* to the new
destination, while `base` brings its *ancestors*. `base` is easier to work with
while `source` is more explicit and slightly more powerful.
