# Saturday, December 14, 2013

## [Adaptive Backgrounds](http://briangonzalez.github.io/jquery.adaptive-backgrounds.js/)

Cool plugin for extracting dominant colors from images - like itunes does for album artwork.

I guess this is the [library](https://github.com/briangonzalez/rgbaster.js)
that does the real work extracting color. From my quick reading of the code it
looks to be extremely naive - just picking out the most common rgb triplet
that's not pure black or white, whether or not it "matches" the rest of the
palette.
