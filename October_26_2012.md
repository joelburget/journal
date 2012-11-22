# October 26, 2012

## 10:42 AM - vim folds

I half learned this years ago but remember nothing.

### `foldmethod` / `fdm`

`manual` - fold by entering commands.
  * `v{motion}zf` - fold an arbitrary block from visual mode
  * `zf{motion}` - fold over the motion, e.g. `zf'a` - fold to `a`
  * `va}zf` - create a fold for the `{...}` block containing the cursor

`indent` - groups of lines with the same indent

`syntax` - pretty much what it sounds like - folds are defined by syntax
highlighting

`expr` - SO POWERFUL, fold with a user defined expression, e.g. fold everything
except matches to your search:

    nnoremap \z :setlocal foldexpr=(getline(v:lnum)=~@/)?0:(getline(v:lnum-1)=~@/)\\|\\|(getline(v:lnum+1)=~@/)?1:2 foldmethod=expr foldlevel=0 foldcolumn=2<CR>

### commands

    * `zc` - close
    * `zo` - open
    * `za` - toggle
    * `zC`, `zO`, `zA` - work on all fold levels
    * `zr` - open a level of folds everywhere
    * `zR` - open all folds
    * `zm` - close a level of folds everywhere
    * `zM` - close all folds
