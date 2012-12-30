# Monday, August 6, 2012

## 11:02 AM
I got in a lot earlier today, just after 9:00 and got to work on slaying emails and fixing the timeline.

Git commands I've learned so far today:

  - `reflog`: This keeps track of where the tips of branches have pointed. Thus it's useful for things like recovering lost commits. Say you commit some changes then run `git reset --hard` and now they're gone. They're not shown in `git log` and you didn't write down the hash. Just fire up `git reflog` and it will show where `HEAD` used to be, i.e. that commit you lost.

## 3:01 PM
After lunch I took Omar, Alpert, David, and Arun to discovery lab so we could interact with kids and see how they use the software. It was great, we got some good feedback - here's David's message to the CS team:

>        Hey, a bunch of us just got back from the discovery lab, where the kids were having their first CS session. We've got some suggestions:
>        - it'd be cool if some known functions auto-completed, so if you just type "ellipse", it'd give you a reasonable ellipse like "ellipse(100, 50, 200, 150);"
>        - arc() parameters should be changed to degrees
>        - in error messages about wrong # of parameters, maybe use the word "numbers" for certain common functions, eg. "ellipse takes 4 numbers, not 3!"
>        - new tutorials topics UI shouldn't be in alphabetical order (programming basics topic should come first, etc.)
>        - what's a semicolon?

I'm also thinking about allowing kids to name colors. Right now the `stroke` and `fill` functions take three parameters, the red, green, and blue color components so it's not easy to name a color...

        var color  = ?;
        fill(?);

## 4:11 PM
Just discovered [Git from the bottom up](/files/git.from.bottom.up.pdf)
