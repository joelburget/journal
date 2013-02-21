# Friday, December 7, 2012

## 2:05 PM - async queries

Apparently calling `.run` will not run a query async, use `util.async_queries`,
based on asynctools.

## 5:02 PM - CS Framework

Every time the (top level) code is run, hints get added to the top as comments:

    /*jshint undef:true,noarg:true,latedef:true,eqeqeq:true,curly:true *//*global name:true,use3DContext:true...*/
    (user's code)

The first list is options to pass to jshint, the second is variable names to
feed to jshint. `true` means "is a global property, but can be overridden",
`false` means "is a global property, but cannot be overridden".

Edit - February 19, 2013:

Jshint is run in a webworker if it's available, otherwise it's just run
normally. After that we go to the `hintDone` function. Note: `runCode` doesn't
run code itself, it just adds the `jshint` and `global` comments, then passes
execution off to jshint and whatever follows.

`hintDone` first brings `hintData.globals` into `Output.context` (the global
context). Or something like that... Looks like it sets `Output.context[global]
= undefined` and `Output.globals[global] = true`, presumably so later on the
code will know to set `Output.context[global]`. It then merges jshint and
babyhint errors. At this point it... runs the exact same global context code as
above... then runs tests on the user's code. The test "framework" is
`Output.testContext` and the tests come from `data.validate`, which comes from
the outer frame. Next we call either `Output.output.runCode` or `Output.exec`
directly. And after that's done, in some poorly defined cases, call `runDone`.
I take that back, `runDone` is always called, it's just not obvious.
