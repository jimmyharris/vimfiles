" Plugins loaded as part of this distribution.
"

" Sensible Defaults:
Plug 'tpope/vim-sensible'

" Cosmetic Plugins:
Plug 'rakr/vim-one'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" You Complete Me:
if !g:is_windows
  function! BuildYCM(info)
    " info is a dictionary with 3 fields
    " - name:   name of the plugin
    " - status: 'installed', 'updated', or 'unchanged'
    " - force:  set on PlugInstall! or PlugUpdate!
    if a:info.status == 'installed' || a:info.force
      !./install.py --clang-completer
    endif
  endfunction
  Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM') }
endif

" Editor Improvements:
Plug 'editorconfig/editorconfig-vim'
Plug 'vim-scripts/grep.vim'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tmhedberg/matchit'
Plug 'Raimondi/delimitMate'
Plug 'henrik/vim-qargs'

Plug 'godlygeek/tabular'

" Comment Manipulation:
Plug 'scrooloose/nerdcommenter'

" Syntax Checking Linting:
Plug 'scrooloose/syntastic'

" Searching And Navigating:
if !g:is_windows && filereadable(expand('~/.fzf/plugin/fzf.vim'))
  " FZF from: https://github.com/junegunn/fzf
  " See https://github.com/junegunn/fzf#using-git for information on how to
  " install FZF locally.
  Plug expand('~/.fzf')
else
  Plug 'ctrlpvim/ctrlp.vim'
endif

Plug 'scrooloose/nerdtree'

" Tmux specific scripts
if !g:is_windows
  Plug 'tmux-plugins/vim-tmux-focus-events'
  Plug 'tmux-plugins/vim-tmux'
endif

" This creates an actual list of tags so it is more useful than tagbar.
Plug 'vim-scripts/taglist.vim', { 'on': 'TlistToggle' }

Plug 'vim-scripts/genutils' | Plug 'vim-scripts/SelectBuf'

" Building:

Plug 'tpope/vim-dispatch'

" Autocomplete and snippets

Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" FileType Plugins:

" Fast starup including many plugins:
" Note: use my fork because it fixes Dockerfile support
Plug 'jimmyharris/vim-polyglot', {'branch': 'fix-dockerfile-syntax-name'}

" C:
Plug 'vim-scripts/a.vim'

" Useful For HTML And XML:
Plug 'tpope/vim-ragtag'

" JSON:
Plug 'tpope/vim-jdaddy', { 'for': ['javascript', 'json'] }

" JavaScript:
Plug 'jelera/vim-javascript-syntax'

" Groovy:
Plug 'jimmyharris/groovyindent'

" Bitbake Support:
if !g:is_windows
  Plug 'kergoth/vim-bitbake'
endif

" Python Support:
if g:is_windows
  Plug 'davidhalter/jedi-vim'
endif
Plug 'raimon49/requirements.txt.vim', {'for': 'requirements'}
Plug 'tmhedberg/SimpylFold'

" Puppet Support:
Plug 'rodjek/vim-puppet'

" Plant UML Syntax:
Plug 'aklt/plantuml-syntax'

" QML Syntax:
Plug 'peterhoeg/vim-qml'

" Lua Utilities:
Plug 'xolox/vim-misc'
Plug 'xolox/vim-lua-ftplugin'

" Latex Mode:
if has('mac')
  Plug 'vim-scripts/TeX-9', { 'for': [ 'LaTeX', 'tex' ] }
endif
" }}}

