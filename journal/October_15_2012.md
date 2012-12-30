# Monday, October 15, 2012

## 8:26 AM - Mercurial Queues, Continued

Updating patches when underlying code changes:

    hg qpop -a
    hg pull
    hg qpush -a

`hg qfold <patch>+` - combine patches into the topmost applied patch
