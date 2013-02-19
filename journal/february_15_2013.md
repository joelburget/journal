# Friday, February 15, 2013

## 10:18 AM - `audit_gae_versions.py`

Here is the tool output in "dry run" mode. If you don't supply "-n", it'll
ask for your GAE admin credentials, and ask for confirmation before
deleting anything. 

    $ tools/audit_gae_versions.py -n
    10:35 PM Application: khan-academy
    10:35 PM Host: appengine.google.com
    Active backends:
        0214-e69d826b18a4
          highmembackend-0214-e69d826b18a4
          mapreducebackend-0214-e69d826b18a4

        0213-9d3fcd88664b
          highmembackend-0213-9d3fcd88664b
          mapreducebackend-0213-9d3fcd88664b

        0213-2b1871776de0
          highmembackend-0213-2b1871776de0
          mapreducebackend-0213-2b1871776de0

        0213-e85ffd4c86c7
          highmembackend-0213-e85ffd4c86c7
          mapreducebackend-0213-e85ffd4c86c7


    Stale backends:
        0212-36c9191d56cf
          highmembackend-0212-36c9191d56cf
          mapreducebackend-0212-36c9191d56cf

    [DRY RUN] Calling "appcfg.py backends . delete highmembackend-0212-36c9191d56cf"
    [DRY RUN] Calling "appcfg.py backends . delete mapreducebackend-0212-36c9191d56cf"


## 3:07 PM - lens `levels`

Make sense of this sometime

    > ["hello","aristid"]^..Lens.levels (traverse.traverse).traverse
    "healrliostid"

    > ["hello","aristid"]^..Lens.levels (traverse.traverse)
    [Zero,Zero,One () 'h',Two 0 (One () 'e') (One () 'a'),Two 0 (One () 'l') (O...

    > ["hello","aristid"]^..Lens.levels (traverse.traverse).to Data.Foldable.toList
    ["","","h","ea","lr","li","os","t","i","d"]

## 5:02 PM - Python's `copy`

"Shallow and deep copy operations"

`copy.copy(x)` - Return a shallow copy of x.

`copy.deepcopy(x)` - Return a deep copy of x.

`exception copy.error` - Raised for module specific errors.

aaaand that's the gist of it.

## 7:41 PM - More Daemontools

Logging (`/service/DAEMON/log/run`):

    #!/bin/bash
    PATH=/usr/local/bin:/usr/bin:/bin
    
    mkdir -p /var/log/daemon
    chown deploy:deploy /var/log/daemon
    exec 2>&1
    exec setuidgid deploy multilog s10485760 -n5 /var/log/daemon

> Which will log output to /var/log/daemon/current 10 MiB at a time, keeping
> up to 5 old log files. I also ensure the daemon’s output directory will
> exist and is writable at the same time.

Note this also tracks `stderr`. `multilog` doesn't lose data when it receives
`TERM`.

* t means to prepend a TAI timestamp on each line;
* s10485760 n5 means to rotate the log file every 10 MiB, and keep 5 history
  files around;
* !tai64nlocal (escaped because we’re in a Shell script, and ! has special
  meaning in the shell) means that on rotation, run the file through the named
  program.

The tai64nlocal program simply reads stdin and replaces TAI timestamps with human-readable ones. If you want to gzip the file on rotation, prepend '!gzip' to the directory and multilog will take care of it.

### `setuidgid`

    setuidgid account child

`account` is a single argument. `child` consists of one or more arguments.
`setuidgid` sets its uid and gid to `account`'s uid and gid, removing all
supplementary groups. It then runs `child`.

`setuidgid` exits 111 if it cannot find a UNIX account named `account`, if it
cannot `setgid`, if it cannot `setuid`, or if it cannot run `child`. Otherwise
its exit code is the same as that of `child`.

`setuidgid` cannot be run by anyone other than root.

### [`multilog`](http://cr.yp.to/daemontools/multilog.html)

> `multilog` reads a sequence of lines from stdin and appends selected lines
> to any number of logs.
