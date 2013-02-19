# Thursday, February 14, 2013

## 10:23 PM - [daemontools](http://cr.yp.to/daemontools.html)

> Daemontools expects a collection of directories in /service. Each
> directory contains a run file, which must be executable. This file sets
> up the environment and runs the daemon. Note that all daemons will be
> started as root, since supervise runs as root. Each service directory
> may also contain a log/ directory, which itself contains a run, to run a
> separate logging program.

You can set environment variables with `envdir` (notice we also drop
priveleges, important!):

    #!/bin/bash
    PATH=/usr/local/bin:/usr/bin:/bin
    cd /u/apps/seevibes/current
    exec                                         \
      envdir /etc/jruby/env                      \
      envdir /etc/seevibes/env                   \
      envdir /u/apps/seevibes/current/config/env \
      setuidgid deploy                           \
      bundle exec thin start

### `envdir`

    envdir d child

> `d` is a single argument. `child` consists of one or more arguments.
> `envdir` sets various environment variables as specified by files in the
> directory named `d`. It then runs `child`.

> If `d` contains a file named `s` whose first line is `t`, `envdir`
> removes an environment variable named `s` if one exists, and then adds
> an environment variable named `s` with value `t`. The name `s` must not
> contain =. Spaces and tabs at the end of `t` are removed. Nulls in `t`
> are changed to newlines in the environment variable.

> If the file `s` is completely empty (0 bytes long), `envdir` removes an
> environment variable named `s` if one exists, without adding a new
> variable.

> `envdir` exits 111 if it has trouble reading `d`, if it runs out of
> memory for environment variables, or if it cannot run `child`. Otherwise
> its exit code is the same as that of `child`.
