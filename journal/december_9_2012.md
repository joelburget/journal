# Sunday, December 9, 2012

## 12:43 PM - The Implementation of Functional Programming Languages

[Because I might want to read it](/files/slpj-book-1987.pdf).

## 1:46 PM - Lens operators

`.~`  |  Replace the focused element with some x
`?~`  |  Replace the focused element with Just x
`%~`  |  Apply a function to the element
`+~`  |  Add to it
`-~`  |  Subtract
`*~`  |  Multiple
`//~` |  Divide
`^~`  |  Take the integral power
`^^~` |  Take the fractional power
`**~` |  Take an arbitrary power
`||~` |  Logically or with a boolean
`&&~` |  Logically and with a boolean

## 1:53 - Git

`git write-tree`: "Create a tree object from the current index"

`git commit-tree <tree> [-p <parent>]*`: Create a commit from a tree, takes the
changelog on stdin or `-m <message>` or `-F <file>`.

`git update-ref <ref> <value>`: Stores `<value>` in `<ref>`.

`git symbolic-ref <name> [<ref>]`: Without `<ref>`, outputs the path of the
branch head `<name>` points to. With `<ref>`, creates or updates `<name>` to
point to `<ref>`.

`git show-branch`: Show the commit ancestry graph.

Interactive Rebasing
--------------------

`git rebase -i`

`pick`: (default) Apply to parent.
`squash`: Fold into the previoius commit
`edit`: Rebasing will stop with the working tree set as this commit. Make
changes, commit, and `rebase --continue`.
(delete): Poof, it's gone.

git reset
---------

`--mixed`: (default) Resets parts of your index and `HEAD` to match the given
commit. Different from `--soft` because it touches the index.
`--soft`: Changes `HEAD` to the given commit. Equivalent to `git update-ref
HEAD <commit>`
`--hard`: Erases all changes in the working tree and changes to the named
commit.

git stash
---------

`git stash` - creates blobs for the working tree and index and a pair of stash
commits for them.

`git stash list`
`git reflog show stash` - same as previous, plus stash commit's hash

`git stash apply`

`git stash clear` - don't do this, throws out all history

`git reflog expire --expire=30.days refs/stash` - clean up older than 30 days

Example Script
--------------

    #!/bin/sh
    git stash && git stash apply

May want to run this from a cron job every hour? Probably not worth it in
practice, plus it would have to be aware of which repos to back up.
