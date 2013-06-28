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

This program also requires [ctags](http://ctags.sourceforge.net/) and
[cscope](http://cscope.sourceforge.net/)([win32 binaries](https://code.google.com/p/cscope-win32/)).

It also requires vim to be compiled with python, ruby and cscope support.

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

1. Download [cscope](https://code.google.com/p/cscope-win32/) and
[ctags](http://ctags.sourceforge.net/) from their respective websites.
  ctags.exe can be found in the latest `.zip` file linked on the front page.

2. copy `cscope.exe` `ctags.exe` and `sort.exe` (bundled with cscope) to
`C:\Windows`.

3. Clone your forked repository to `~/vimfiles`.

4. Update and initalize the submodules.

5. For Windows 7 use mlink to create hardlinks between the `vimrc/gvimrc` files
in this repository and the `_vimrc\_gvimrc` files in the home directory.
```
> cd %HOME%
> mlink /H vimfiles/vimrc _vimrc
> mlink /H vimfiles/gvimrc _gvimrc
```
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

#### General Editing:

  * [Tabular](https://github.com/godlygeek/tabular)
  * [delimitMate](https://github.com/Raimondi/delimitMate)
  * [Surround](https://github.com/tpope/vim-surround)
  * [Unimpaired](https://github.com/tpope/vim-unimpaired)
  * [Abolish](https://github.com/tpope/vim-abolish)
  * [Endwise](https://github.com/tpope/vim-endwise)
  * [Ragtag](https://github.com/tpope/vim-ragtag)
  * [Repeat](https://github.com/tpope/vim-repeat)

#### Navigation:

  * [NERDTree](https://github.com/scrooloose/nerdtree)
  * [ctrlp.vim](https://github.com/kien/ctrlp.vim)
  * [taglist.vim ](https://github.com/vim-scripts/taglist.vim)
  * [greplace.vim](https://github.com/vim-scripts/greplace.vim)
  * [henrik/vim-qargs](https://github.com/henrik/vim-qargs)
  * [SelectBuf](https://github.com/vim-scripts/SelectBuf)

#### Colors:

  * [Color Sampler Pack](https://github.com/vim-scripts/Color-Sampler-Pack)
  * [Solarized Colorscheme](https://github.com/jimmyharris/vim-colors-solarized)

#### Git Integration:

  * [Fugitive](https://github.com/tpope/vim-fugitive)
  * [henrik/git-grep-vim](https://github.com/henrik/git-grep-vim)

#### Ruby:

  * [Rails.vim](https://github.com/tpope/vim-rails)
  * [Bundler.vim](https://github.com/tpope/vim-bundler)
  * [RVM.vim](https://github.com/tpope/vim-rvm)
  * [Cucumber.vim](https://github.com/tpope/vim-cucumber)
  * [dbext.vim](https://github.com/vim-scripts/dbext.vim)

#### Javascript/JSON:

  * [JSON Syntax Support](https://github.com/jakar/vim-json)
  * [JavaScript Indent](https://github.com/vim-scripts/JavaScript-Indent)

#### LaTeX

  * [TeX-9](https://github.com/vim-scripts/TeX-9)

#### C/C++

  * [a.vim](https://github.com/vim-scripts/a.vim)
  * [cscope.vim](https://github.com/brookhong/cscope.vim)
  * [OmniCppComplete](https://github.com/vim-scripts/OmniCppComplete)

#### Other Languages

  * [Arm Assembly Language](https://github.com/vim-scripts/armasm)
  * [Applescript](https://github.com/vim-scripts/applescript.vim)
  * [Markdown](https://github.com/tpope/vim-markdown)
  * [Puppet DSL](https://github.com/puppetlabs/puppet-syntax-vim)

#### Snippets

  * [snipMate](https://github.com/garbas/vim-snipmate)
  * [UltiSnips](https://github.com/SirVer/ultisnips)


#### Shell Integration

  * [Vimux](https://github.com/benmills/vimux)
  * [Conque Shell](https://github.com/vim-scripts/Conque-Shell)

#### Utilities

  * [tlib_vim](https://github.com/tomtom/tlib_vim)
  * [vim-addon-mw-utils](https://github.com/MarcWeber/vim-addon-mw-utils)
  * [genutils](https://github.com/vim-scripts/genutils)

### Plugins with My Modifications

The following plugins  have special modifications for my tastes.  If you wish
to use them by all means do so, but it is recomended that you remove these and
add direct links to the original repositories I forked them from as those
update more frequently.

  * [Vim Snippets](https://github.com/jimmyharris/vim-snippets) -- Always good to have your own snippets library. (originally via [honza](https://github.com/honza/vim-snippets))
  * [Solarized Colorscheme](https://github.com/jimmyharris/vim-colors-solarized) -- This plugin is ugly when used with tagslist. I have modified it to be cleaner on windows. (originally via [altercation](https://github.com/altercation/vim-colors-solarized))
  * [NERDCommenter](https://github.com/jimmyharris/nerdcommenter) -- Ocasionally I will discover languages that this plugin does not support.  I add them here and submit them upstream. (orivinally via [Scrooloose](https://github.com/scrooloose/nerdcommenter))
