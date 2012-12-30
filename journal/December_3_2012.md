# Monday, December 3, 2012

## 4:42 PM - name of a class in Python

`cls.__name__` or `instance.__class__.__name__`

## 4:49 PM - blobstore blobs are not related to datastore blob properties

## 7:24 PM - My commits in the last week

    hg log -r "author('joel@khanacademy.org') and date(-7)"

## 8:53 PM - Cookieless domains

> From a performance perspective, the trouble with cookies is that once the
> server sets a cookie for a particular domain, all subsequent HTTP requests
> for that domain must include the cookie.  Even if the server has no use for
> the cookie, as is usually the case with static components, the cookie is sent
> over the wire anyway, bloating our request headers with useless code.

## 9:05 PM - Just added [moreutils](http://joeyh.name/code/moreutils/) to my dotfiles

    chronic: runs a command quietly unless it fails
    combine: combine the lines in two files using boolean operations
    ifdata: get network interface info without parsing ifconfig output
    ifne: run a program if the standard input is not empty
    isutf8: check if a file or standard input is utf-8
    lckdo: execute a program with a lock held
    mispipe: pipe two commands, returning the exit status of the first
    parallel: run multiple jobs at once
    pee: tee standard input to pipes
    sponge: soak up standard input and write to a file
    ts: timestamp standard input
    vidir: edit a directory in your text editor
    vipe: insert a text editor into a pipe
    zrun: automatically uncompress arguments to command

## 9:07 PM - Process Substitution

> This allows programs that normally only accept files to directly read from or
> write to another program.

`<(command)` - make command's output appear as a file.
`>(command)` - make output that would go to a file go to a process

Examples:
`tee >(wc -l >&2)` - use in a pipeline to get the word count and contine the
pipeline
`diff <(sort file1) <(sort file2)` - compare two sorted files
