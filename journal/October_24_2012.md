# October 24, 2012

## 1:50 PM - `git filter-branch`

`git filter-branch --{env,tree,index,parent,msg,commit,tag-name,subdirectory}-filter <command> [--prune-empty] <rev-list options>

Rewrites revision history

## 1:56 PM - bare double dashes

> You can separate options from a list of arguments via the "bare double dash"
> convention. For instance, use the double dash to contrast the control portion
> of the command line from a list of operands, such as filenames.

    $ git diff -w master origin -- tools/Makefile

> You may need to use the double dash to separate and explicitly identify
> filenames if they might otherwise be mistaken for another part of the
> command.

    # checkout the tag named main.c
    $ git checkout main.c

    # checkout the file named main.c
    $ git checkout -- main.c
