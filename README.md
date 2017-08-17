# My dot files

Prepare first:

    $ dotfiles prepare

That will precalculate some envvars and store them as `dot.bashrc.d/00_vars`
so that we won't have to do it on every new session. These are envvars
that are a bit slow to calculate, mainly because they result from `brew --prefix $PROGRAM`
which is not fast to run.

## Vim

For neovim-remote:

    $ pip3 install --upgrade neovim-remote

Using git submodules for packages. After linking `.vim/` and `.vimrc` Do:

    $ git submodule init
    $ git submodule update

Then start vim and run `:PackUpdate`. Exit, re-enter and it should not complain about the color scheme or anything else anymore.


## Sublime Text 3

Link this `Sublime Text 3/Packages/Users` from your `$HOME/Library/Application Support/Sublime Text 3/Packages`.

# License

Public domain, as described on LICENSE.txt.
