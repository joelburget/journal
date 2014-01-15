# Wednesday, January 15, 2013

## [codemod](https://github.com/facebook/codemod)

> Codemod is a tool/library to assist you with large-scale codebase refactors
> that can be partially automated but still require human oversight and
> occasional intervention.

For example:

    codemod.py -m -d /home/jrosenstein/www --extensions php,html \
        '<font *color="?(.*?)"?>(.*?)</font>' \
        '<span style="color: \1;">\2</span>'

This allows you to manually accept or edit each of the changes.
