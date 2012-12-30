# Sunday, October 14, 2012

## 5:30 PM - Mercurial Queues (MQ)

Inspired by quilt. Mutable history!!

`hg qinit` - initialize mq

`hg qnew <patch name>` - begin work on a new patch

`.hg/patches/series` lists the patches MQ knows about for this repo

`hg qrefresh` - update the patch you're working on

`hg qseries` lists the patches mq knows about in this repo, from oldest to newest

`hg qapplied` lists every patch mq has applied in this repo, from oldest to newest

`hg qpop [-a]` - undo the application of a patch

`hg qpush [-a] [-m]` - apply a patch

`hg qdelete <patch name>` - delete a patch

`hg qfinish <revision> [-a]` - turn <revision> into a permanent changeset (must already be applied)

`hg qimport -r <rev>` - turn an existing changeset into a patch
