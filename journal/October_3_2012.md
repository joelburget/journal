# Wednesday, October 3, 2012

## jQuery's `closest`

`closest( (selector(s) | jQuery object | element) )` - Get the first
element that matches the selector by testing the element itself and traversing
*up* through its ancestors in the DOM.

So what does this have to do if you pass in a jQuery object or element? A
jQuery object can hold multiple elements so `closest` would then find the first
of those. I suppose it must be possible to do something analagous with a
regluar element.
