# Sunday, December 29, 2013

## [Why does Google prepend while(1); to their JSON responses?](http://stackoverflow.com/a/2669766)

Because other domains can't make an ajax request so they have to use a script
tag, which will execute the `while(1)`.

## [How can I use Control.Lens to update the ith element of a list?](http://stackoverflow.com/a/17006769)

Use `ix`.

Looks like `ix` is for finding the `i`th thing in a structure, while `at` is
for keys in a map-like container. Or something.

## [React's Diff Algorithm](http://calendar.perfplanet.com/2013/diff/)

Nice to get a better understanding of some of the trickier points of React.

React uses some heuristics to make finding a diff easier:
* it only compares level-by-level - nodes are rarely moved between levels
* keys help match up nodes in a list
* when a different component replaces a component React doesn't try to diff
  inside of them - just replaces

React implements event delegation with a single event listener at the root and
then virtually captures and bubbles the events. It actually creates a new event
for each listener so they can be modified. React uses a pool of events to avoid
too many memory allocations.

React batches updating so the dom is only updated once per event loop.
