# Saturday, February 2, 2012

## 6:07 PM - sleepwatcher

I just installed [sleepwatcher](http://www.bernhard-baehr.de/) so I can make OS
X eject external disks when it goes to sleep (which it should do on its own
instead of showing the dialog about not ejecting properly when you wake back
up).
    
Install sleepwatcher

    > brew install sleepwatcher

Put this in `~/.sleep`

    osascript -e 'tell application "Finder" to eject (every disk)'

Or alternately

    find /Volumes -maxdepth 1 -not -user root -print0 | xargs -0 diskutil eject
