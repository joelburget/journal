# Friday, August 2, 2013

## tmux copy paste

It's finally here! Tmux [copy and paste](http://robots.thoughtbot.com/post/55885045171/tmux-copy-paste-on-os-x-a-better-future) for mac.

I also learned about pbcopy (assigns its stdin to the clipboard) and pbpaste
(clipboard -> stdout).

You actually need `reattach-to-user-namespace` to use pbcopy and pbpaste with tmux. Why?
