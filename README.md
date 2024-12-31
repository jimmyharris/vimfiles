# My $HOME/.vim in Git.

NOTE!: This is now explicitly a neovim repository as I am moving to init.lua
and lazy.nvim More details will arrive in a future commit.

This configuration is designed to be useful for working with C/C++ as well as
dynamic languages like Ruby, Javascript, and Python.

Plugins are managed using [lazy](https://github.com/junegunn/vim-plug).

Most of the settings use [sensible.vim](https://github.com/tpope/vim-sensible)
as a baseline. (TODO: is this required in neovim anymore?)

## Instalation instructions

This repository is meant to be persionalized. It is by no means generic and
should not be directly cloned from my repository.  Please
[fork](https://github.com/jimmyharris/vimfiles/fork) this repository before
installing it.

### Requirements

My configuration assumes the following conditions:

1. uv installed for python installation
2. pyright
3. [Ctags](http://ctags.sourceforge.net/) is installed.
4. NeoVim 0.10.3 or newer.
5. A nerdfont
   installed. This config uses the powerline version of SourceCodePro.
6. Build and make tools

### Mac/Linux

1. Clone your forked repository to `~/.config/nvim`
3. Launch nvim (plugins should install and build automatically.

### Windows

Currently untested Please see additional testing.


## Included Plugins

Installed plugins can be found in `lua/plugin_specs.lua`


## Overrides

To be implemented.


