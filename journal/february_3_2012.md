# Sunday, February 3, 2012

## 12:23 PM - vim registers

Unnamed register - Always written to, can be referenced with `""`.

Black hole register - `"_` - everything that goes in is discarded, analogous to
`/dev/null`. Use it if you don't want to clobber the unnamed register - `"_dd`.

Numbered registers - `0` always contains the most recently yanked text. `1`
through `9` reference the most recently deleted text.

Small delete register - `"-` stores any text you deleted that was less than a
line in length.

Last inserted text register - `".` contains the last text you inserted.

Filename registers - `"%` contains the name of the current file, `"#` contains
the alternate file's name.

Command registers - `":` contains the most recently executed `:` command.

Search registers - `"/` contains the most recent search pattern.

Expression register - `"=` allows you do treat the results of arbitrary
calculations in register context. I don't see any reason you would want to do
this.
