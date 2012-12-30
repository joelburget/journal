# Friday, October 5, 2012

## 1:23 PM - vimrc additions

From (pbrisbin)[http://pbrisbin.com/posts/sharpening_your_tools]

    set winwidth=84
    set winheight=5
    set winminheight=5
    set winheight=999

And his description -

> Basically, all non focused windows shrink down to 5 lines and the focused
> window takes up everything that’s left. This is an amazing workflow b/c it
> allows you to have a lot of files open at once, but they don’t get in your
> way. You can still maintain focus on one at a time. Just try it, it’s
> awesome.

### edit - 1:47 PM

I tweaked the formula a bit after noticing `winheight` appeared twice:

    set winwidth=84
    set winminwidth=10
    set winheight=999
    set winminheight=0

`winminheight=0` means windows collapse down to just a status bar.

## 1:32 PM - more vim commands

Split all buffers - `:sba` or `:vert sba`.

Or open vim with all the files as well as `-O`.

Open all the results of an `ack` - `vim "-c bufdo /word" $(ack -l word)`.
