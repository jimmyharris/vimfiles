# My $HOME/.vim in Git.

This configuration is designed to be useful for working with C/C++ as well as
dynamic languages like Ruby, Javascript, and Python.

Plugins are managed using [pathogen](tpope/vim-pathogen).

It also supports some [tmux](http://tmux.sourceforge.net/) integration.

## Instalation instructions

It is highly recomended that you fork this repository for your own use.

### Mac/Linux

Clone your forked repository to `~/.vim`.

Then symlink `vimrc` and `gvimrc` to `~/.vimrc` and `~/.gvimrc` respectively.

### Windows

This works best when using Git for Windows.

Clone your forked repository to `~/vimfiles`.

Prefered method is to use the `mlink` command to link `vimrc` and `gvimrc` into the home directory.

## Included Plugins

Below are a list of included plugins grouped by purpose.

### General Editing:

  * godlygeek/tabular
  * Raimondi/delimitMate
  * tpope/vim-surround
  * tpope/vim-unimpaired
  * tpope/vim-abolish
  * tpope/vim-endwise
  * tpope/vim-ragtag
  * tpope/vim-repeat

### Navigation:

  * scrooloose/nerdtree
  * kien/ctrlp.vim
  * vim-scripts/taglist.vim
  * vim-scripts/greplace.vim
  * henrik/vim-qargs
  * vim-scripts/SelectBuf

### Colors:

  * vim-scripts/Color-Sampler-Pack
  * jimmyharris/vim-colors-solarized

### Git Integration:

  * tpope/vim-fugitive
  * henrik/git-grep-vim

### Ruby:

  * tpope/vim-rails
  * tpope/vim-bundler
  * tpope/vim-rvm
  * tpope/vim-cucumber
  * vim-scripts/dbext.vim

### Javascript/JSON:

  * jakar/vim-json
  * vim-scripts/JavaScript-Indent

### LaTeX

  * vim-scripts/TeX-9

### C/C++

  * brookhong/cscope.vim
  * vim-scripts/OmniCppComplete
  * vim-scripts/a.vim

### Other Languages

  * vim-scripts/armasm
  * vim-scripts/applescript.vim
  * tpope/vim-markdown
  * puppetlabs/puppet-syntax-vim

### Snippets

  * garbas/vim-snipmate
  * SirVer/ultisnips


### Shell Integration

  * benmills/vimux
  * vim-scripts/Conque-Shell

### Utilities

  * tomtom/tlib_vim
  * MarcWeber/vim-addon-mw-utils
  * vim-scripts/genutils

## Plugins with My Modifications

  * jimmyharris/vim-snippets -- Always good to have your own snippets library.
  * jimmyharris/vim-colors-solarized -- This plugin is ugly when used with tagslist. I have modified it to be cleaner on windows.
  * jimmyharris/nerdcommenter -- Ocasionally I will discover languages that this plugin does not support.  I add them here and submit them upstream.
