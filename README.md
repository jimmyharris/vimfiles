## My $HOME/.vim in Git.

This configuration is designed to be useful for working with C/C++ as well as
dynamic languages like Ruby, Javascript, and Python.

Plugins are managed using [pathogen](tpope/vim-pathogen).

It also supports some [tmux](http://tmux.sourceforge.net/) integration.

### Requiremetns

This configuration depends on Python v2.7 or greater, and a working Ruby
instalation (if you plan on using the ruby specific plugins).

If you do not intend to use ruby support remove those submodule sfrom your fork
of this repository.

It also requires vim to be compiled with python and ruby support.

### Instalation instructions

It is highly recomended that you fork this repository for your own use.

#### Mac/Linux

Clone your forked repository to `~/.vim`.

Update and initalize the submodules.

Then symlink `vimrc` and `gvimrc` to `~/.vimrc` and `~/.gvimrc` respectively.

#### Windows

This works best when using Git for Windows and a verison of
[Vim](http://sourceforge.net/projects/cream/files/Vim/) with python and ruby
scripting bindings.

It also requires [ruby](http://rubyinstaller.org) and
[python](http://www.python.org/getit/).

Clone your forked repository to `~/vimfiles`.

Update and initalize the submodules.

Prefered method is to use the `mlink` command to link `vimrc` and `gvimrc` to
`~/_vimrc` and `~/_gvimrc` respectively.

If `mlink` will not work (Windows XP and lower), simply copy the included vimrc
and gvim rc files.  But be careful.  changes made to the `_vimrc` and `_gvimrc`
files will not be propogated back to your repository, you will need to change
them manually.

### Updating Plugins

To Update Plugins run the following command from the root of the repository

1. make sure the repos is up to date with the remote repository

     git pull

2. make sure submodules are up to date with the remote repository

     git submodule sync
     git submodule update --init --recursive

3. Pull all remote submodules to master
     git submodule foreach 'git checkout master; git pull'

4. Verify modules are working.

5. commit updated submodules to the repostiroy

     git add .
     git commit

6. push changes to GitHub

     git push

After this push updates will be available to all computers using this configuration.

## Included Plugins

Below are a list of included plugins grouped by purpose. Please see individual
plugin repos for information on how to use them.

Bindings are grouped by plugin in `.vimrc`.

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

The following plugins  have special modifications for my tastes.  If you wish
to use them by all means do so, but it is recomended that you remove these and
add direct links to the original repositories I forked them from as those
update more frequently.

  * jimmyharris/vim-snippets -- Always good to have your own snippets library. (originally via honza/vim-snippets)
  * jimmyharris/vim-colors-solarized -- This plugin is ugly when used with tagslist. I have modified it to be cleaner on windows. (originally via altercation/vim-colors-solarized)
  * jimmyharris/nerdcommenter -- Ocasionally I will discover languages that this plugin does not support.  I add them here and submit them upstream. (orivinally via scrooloose/nerdcommenter)
