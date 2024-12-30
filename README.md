# My $HOME/.vim in Git.

NOTE!: This is now explicitly a neovim repository as I am moving to init.lua
and lazy.nvim More details will arrive in a future commit.

This configuration is designed to be useful for working with C/C++ as well as
dynamic languages like Ruby, Javascript, and Python.

Plugins are managed using [vim-plug](https://github.com/junegunn/vim-plug).

Most of the settings use [sensible.vim](https://github.com/tpope/vim-sensible)
as a baseline.

## Instalation instructions

This repository is meant to be persionalized. It is by no means generic and
should not be directly cloned from my repository.  Please
[fork](https://github.com/jimmyharris/vimfiles/fork) this repository before
installing it.

### Requirements

My configuration assumes the following conditions:

1. Python 2.7 or greater is installed (currently only tested with python2.7)
2. Pylint (for plyint based syntastic support)
3. [Ctags](http://ctags.sourceforge.net/) is installed.
4. Vim is compiled with support for the following features:
   * Python interpreter
5. [Powerline fonts](https://github.com/Lokaltog/powerline-fonts) should be
   installed. This config uses the powerline version of SourceCodePro.
6. (Non-Windows systems) [fzf](https://github.com/junegunn/fzf)
7. (Non-Windows Systems) [YouCompleteMe](https://github.com/Valloric/YouCompleteMe)

Alternately: NeoVim is used with python plugins.

### Mac/Linux

1. Clone your forked repository to `~/.vim`. or `~/.config/nvim`
2. Then symlink `vimrc` and `gvimrc` to `~/.vimrc` and `~/.gvimrc` respectively. (Vim Only)
3. Launch Vim and run PlugInstall to get all updated plugins.

### Windows

First thing to do is get the prerequisites.  This can be done using either
chocolatey or individual installer packages. Chocolatey is recommended for
personal use environments.

##### Install Prerequisites Using Chocolatey

Get [Chocolatey](https://chocolatey.org/) then install the following packages:

  * `choco install git`
  * `choco install python`
  * `choco install vim`
  * `choco install ctags`

Cscope does not yet have a package on [Chocolatey](http://chocolatey.org/) so it
will need to be installed manually.

##### Pre-reqs Manually

My configuration is designed for use with [Git for Windows](http://git-scm.com/)
and the latest version of Vim from the
[Cream](http://sourceforge.net/projects/cream/files/Vim/) project. It also
requires ruby (downloadable at [rubyinstaller.org](http://rubyinstaller.org)) and
[python](http://www.python.org/getit/).

After installing the above packages ctags can be found for download at
the [ctags sourceforge](http://ctags.sourceforge.net/) page. Simply download it
and copy `ctags.exe` to `C:\Windows`.

##### Getting the Repo.

1. Clone your forked repository to `~/vimfiles`.

3. For Windows 7 use mlink to create hardlinks between the `vimrc/gvimrc` files
   in this repository and the `_vimrc/_gvimrc` files in the home directory. (VIM only)
```
> cd %USERPROFILE%
> mklink /H _vimrc vimfiles\vimrc
> mklink /H _gvimrc vimfiles\gvimrc
```
If `mklink` will not work (Windows XP and lower), simply copy the included
vimrc and gvim rc files.  But be careful!  Changes made to the `_vimrc` and
`_gvimrc` files will not be propagated back to your repository, you will need
to change them manually.

Note: Windows does not support fzf file finding or YouCompleteMe auto completion.


## Included Plugins

Installed plugins can be found in bundles.vim


## Overrides

This plugin allows several methods for out of system override all from the
local directory.

### local/bundles.vim

This is a place to install extra plugins that might need to be local to a
speicif machine, or for testing plugins/bindings that do not yet need to be
uploaded to the repository.

### local/overrides/

This is a single vim-plug plugin that will be loaded last in the search order.
It is meant for additons that are added after vim plugins are loaded. Again
this is meant for snippets/other plugins that should not be committed to the
root repository.

### local/init.vim

This file is an extention of the vimrc/init.vim file that will be sourced after
the main init.vim/vimrc file has been sourced. It will execute immediately at
the end of init.vim but before all plugins are loaded.


