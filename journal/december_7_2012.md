# Friday, December 7, 2012

## 2:05 PM - async queries

Apparently calling `.run` will not run a query async, use `util.async_queries`,
based on asynctools.

## 5:02 PM - CS Framework

Every time the (top level) code is run, hints get added to the top as comments:

    /*jshint undef:true,noarg:true,latedef:true,eqeqeq:true,curly:true *//*global name:true,use3DContext:true...*/
    (user's code)

The first list is options to pass to jshint, the second is variable names to
feed to jshint. `true` means "is a global proeprty, but can be overridden",
`false` means "is a global property, but cannot be overridden".
