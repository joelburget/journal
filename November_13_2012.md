# Tuesday, November 13, 2012

## 10:20 AM - Fixit III

Today is the third KA fixit. A quick sed command I used several times to replace trailing underscores with leading

    sed -i '' -e's/\(currentTab\)_/_\1/g' *.js

`-i ''` is for edit in place, which takes a mandatory argument, the extension
to save a backup file with, just pass '' to not back up.
