# Tuesday, February 19, 2013

## 3:09 PM - Expando

Noun:
expando (plural expandos)
(computing, programming) A property added to an object at run-time.

Etymology:
Perhaps a short form of expandable object.

## 3:11 PM - Hipchat slash commands

* /join - This will let you into any pre-existing room, but since HipChat rooms
  have fairly loose naming conventions (we allow things like spaces and
  non-alphanumeric characters), we generally suggest using the ctrl-j shortcut
  instead. Still, if you just can’t give up your IRC-style navigation, it can
  be helpful.
* /part - Leave the room you’re currently in.
* /available | /back | /here <msg> - Shortcut for setting your status to
  available (green bubble). The <msg> part is optional.
* /away <msg> - Set your status to away (yellow bubble). In appearance, this is
  the same as going idle, except it doesn’t automatically return your status to
  ‘available’ when you come back.
* /dnd <msg> - Set status to do not disturb (red bubble)
* /topic <msg> - Set the topic for the current room (just like if you hit
  ctrl-t or double clicked on the topic bar and typed something in)
* /quote <msg> - Displays the message formatted with a monospace font,
  regardless of length or number of newlines in the message
* /me | /em <msg> - The “emote” command. This will let you display a line of
  grey text with your name at the beginning, similar to the style room join and
  leave messages. For example, if I typed “/me is happy.” it would show “Chris
  Rivers is happy.” in the chat.

## 5:34 PM - Scratchpad Test Suite

`python -m SimpleHTTPServer` ->
http://localhost:8000/javascript/scratchpads-exec-package/tests/index.html

## 6:34 PM - Edwin Brady on why partial functions are allowed in Idris

http://edwinb.wordpress.com/2013/02/19/on-partial-functions-in-idris/

First, because it's convenient to allow type errors during development, and as
an extension it's convenient to allow partial functions. Second, it allows the
programmer to decide what level of precision their types should have.
