# Wednesday, September 5, 2012

## 9:01 AM
[Probabilistic m2m relationships using bloom
filters](http://blog.zacharyvoase.com/2012/08/31/m2mbloom/)

A 25x speedup in his example from getting rid of the junction table with a 0.5%
false positive probability. The hard part will be thinking of uses where the
false positives are acceptable.

## 9:10 AM
[GNU Coreutils Cheat Sheet](/media/files/gnu-coreutils-cheat-sheet.pdf)

[GHC Holes](http://hackage.haskell.org/trac/ghc/wiki/Holes) - Something to be
filled in, from which you can extract the expected type and the local bindings
in the scope of the hole.

## 9:59 AM - `delete`

I'm embarrassed, I just discovered javascript's `delete`.

You can delete object properties

    var o = {x: 1};
    delete o.x; // true
    o.x; //undefined

but not variables or functions

    var x = 1;
    function y() {};
    delete x; // false
    delete y; // false

    x; // 1
    typeof y; // "function"

`delete` only returns `false` when a property can't be deleted.

There are three types of executable code in javascript; *global code*,
*function code*, and *eval code*. When code executes it always happens within a
certain *execution context* and each of the types of code has an execution
context. These contexts can form a stack so there might be a fuction with it's
*function execution context* executing within the *global code* with its
*global execution context*.

Each *execution context* has a *variable object*, where the functions and
variables declared within that scope are added as properties. There is the
global object and for functions there is the *activation object* where
variables and functions declared within the function are added as well as
function arguments and `arguments`. Variables declared within *eval code* are
created as properties of the calling context's *variable object*.

    eval('var bar = 1;');
    bar; // 1

Now, every property can have the following flags set: `ReadOnly`, `DontEnum`,
`DontDelete`, `Internal`. Declared variables and functions have `DontDelete`
set, but properties don't.

    var foo = 1; // DontDelete
    function bar() {} // DontDelete
    var baz = {x: 1}; // baz: DontDelete, baz.x: (not set)

Some builtins also have `DontDelete` set, like `arguments`,
`<function>.length`, and function arguments.

This means undeclared assignment creates a deletable property because
undeclared assignment creates a property on the global object.

    var foo = 1;
    bar = 2;

    delete foo; // false
    typeof foo; // "number"

    delete bar; // true
    typeof bar; // "undefined"

[Reference (and browser compliance
info)](http://perfectionkills.com/understanding-delete/)
