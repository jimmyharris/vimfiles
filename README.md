# My $HOME/.vim in Git.

This configuration is designed to be useful for working with C/C++ as well as
dynamic languages like Ruby, Javascript, and Python.

Plugins are managed using [pathogen](https://github.com/tpope/vim-pathogen).

Most of the settings use [sensible.vim](https://github.com/tpope/vim-sensible)
as a baseline.

## Instalation instructions

This repository is meant to be persionalized. It is by no means generic and
should not be directly cloned from my repository.  Please
[fork](https://github.com/jimmyharris/vimfiles/fork) this repository before
installing it.

### Requirements

My configuration assumes the following conditions:

1. Python 2.7 or greater is installed
2. Ruby is installed (for ruby based development)
3. [Ctags](http://ctags.sourceforge.net/) is installed.
4. Vim is compiled with support for the following features:
   * Python interpreter
   * Ruby interpreter
   * Cscope support (if you intend to use Cscope features)
5. [Powerline fonts](https://github.com/Lokaltog/powerline-fonts) should be
   installed. This config uses the powerline version of SourceCodePro.
6. [cscope](http://cscope.sourceforge.net/)
([win32 binaries](https://code.google.com/p/cscope-win32/) is installed. (optional)


### Mac/Linux

1. Clone your forked repository to `~/.vim`.
2. Update and initialize the submodules.
3. Then symlink `vimrc` and `gvimrc` to `~/.vimrc` and `~/.gvimrc` respectively.

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
  * `choco install ruby` (optional)
  * `choco install ruby.devkit` (optional)

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

##### Cscope (optional)

1. Download [cscope](https://code.google.com/p/cscope-win32/)
2. Copy `cscope.exe` and `sort.exe` (bundled with cscope) into `C:\Windows`.

##### Getting the Repo.

1. Clone your forked repository to `~/vimfiles`.

2. Update and initialize the submodules.

3. For Windows 7 use mlink to create hardlinks between the `vimrc/gvimrc` files
   in this repository and the `_vimrc/_gvimrc` files in the home directory.
```
> cd %USERPROFILE%
> mklink /H _vimrc vimfiles\vimrc
> mklink /H _gvimrc vimfiles\gvimrc
```
If `mklink` will not work (Windows XP and lower), simply copy the included
vimrc and gvim rc files.  But be careful!  Changes made to the `_vimrc` and
`_gvimrc` files will not be propagated back to your repository, you will need
to change them manually.

### Updating Plugins

To update plugins run the following command from the root of the repository

1. Make sure the repos is up to date with the remote repository
```
git pull
```

2. Make sure submodules are up to date with the remote repository
```
git submodule sync
git submodule update --init --recursive
```

3. Pull all remote submodules to master
```
git submodule foreach 'git checkout master; git pull'
```

4. Verify modules are working.

5. Commit updated submodules to the repository
```
git add .
git commit
```

6. Push changes to GitHub
```
git push
```

After this push updates will be available to all computers using this
configuration through:
```
git pull
```

## Included Plugins

Below are a list of included plugins grouped by purpose. Please see individual
plugin repositories for documentation on how to use them.  These plugins are
separated into two groups:

  * Plugins used pristinely from the upstream repository.
  * Plugins I have modified to suit my needs.

Bindings are grouped by plugin in `.vimrc`.

### Unmodified Plugins

#### General Editing:

  * [AirLine](https://github.com/bling/vim-airline)
  * [Abolish](https://github.com/tpope/vim-abolish)
  * [delimitMate](https://github.com/Raimondi/delimitMate)
  * [Endwise](https://github.com/tpope/vim-endwise)
  * [Ragtag](https://github.com/tpope/vim-ragtag)
  * [Repeat](https://github.com/tpope/vim-repeat)
  * [Sensible.vim](https://github.com/tpope/vim-sensible)
  * [Surround](https://github.com/tpope/vim-surround)
  * [Tabular](https://github.com/godlygeek/tabular)
  * [Unimpaired](https://github.com/tpope/vim-unimpaired)

#### Navigation:

  * [NERDTree](https://github.com/scrooloose/nerdtree)
  * [ctrlp.vim](https://github.com/kien/ctrlp.vim)
  * [taglist.vim ](https://github.com/vim-scripts/taglist.vim)
  * [greplace.vim](https://github.com/vim-scripts/greplace.vim)
  * [qargs](https://github.com/henrik/vim-qargs)
  * [SelectBuf](https://github.com/vim-scripts/SelectBuf)

#### Colors:

  * [Color Sampler Pack](https://github.com/vim-scripts/Color-Sampler-Pack)
  * [base16](https://github.com/chriskempson/base16-vim)
  * [Solarized Colorscheme](https://github.com/jimmyharris/vim-colors-solarized)

#### Testing and Integration:

  * [Dispatch](https://github.com/tpope/vim-dispatch)

#### Git Integration:

  * [Fugitive](https://github.com/tpope/vim-fugitive)

#### Ruby: (disabled by default)

  * [Rails.vim](https://github.com/tpope/vim-rails)
  * [Bundler.vim](https://github.com/tpope/vim-bundler)
  * [RVM.vim](https://github.com/tpope/vim-rvm)
  * [Cucumber.vim](https://github.com/tpope/vim-cucumber)
  * [dbext.vim](https://github.com/vim-scripts/dbext.vim)

#### Javascript/JSON:

  * [JSON Syntax Support](https://github.com/jakar/vim-json)
  * [Jdaddy](https://github.com/tpope/vim-jdaddy)
  * [JavaScript Indent](https://github.com/vim-scripts/JavaScript-Indent)

#### LaTeX

  * [TeX-9](https://github.com/vim-scripts/TeX-9)

#### C/C++

  * [a.vim](https://github.com/vim-scripts/a.vim)
  * [cscope.vim](https://github.com/brookhong/cscope.vim) (disabled)
  * [OmniCppComplete](https://github.com/vim-scripts/OmniCppComplete) (disabled)

#### Other Languages

  * [ARM Assembly Language](https://github.com/vim-scripts/armasm)
  * [Applescript](https://github.com/vim-scripts/applescript.vim)
  * [Markdown](https://github.com/tpope/vim-markdown)
  * [Puppet DSL](https://github.com/puppetlabs/puppet-syntax-vim)

#### Snippets

  * [UltiSnips](https://github.com/SirVer/ultisnips)
  * [snippets](https://github.com/honza/vim-snippets)


#### Shell Integration

  * [Vimux](https://github.com/benmills/vimux)

#### Utilities

  * [tlib_vim](https://github.com/tomtom/tlib_vim)
  * [vim-addon-mw-utils](https://github.com/MarcWeber/vim-addon-mw-utils)
  * [genutils](https://github.com/vim-scripts/genutils)

### Plugins with My Modifications

The following plugins  have special modifications for my tastes.  If you wish
to use them by all means do so, but it is recommended that you remove these and
add direct links to the original repositories I forked them from as those
update more frequently.

  * [Solarized Colorscheme](https://github.com/jimmyharris/vim-colors-solarized)
    (via [altercation](https://github.com/altercation/vim-colors-solarized)) -
    This plugin is ugly when used with tagslist. I have modified it to be
    cleaner on windows.
  * [NERDCommenter](https://github.com/jimmyharris/nerdcommenter)
    (via [Scrooloose](https://github.com/scrooloose/nerdcommenter)) -
    Occasionally I will discover languages that this plugin does not support.
    I add them here and submit them upstream.
