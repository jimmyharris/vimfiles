" init.vim/Vimrc by James Harris.

" Detect Windows OS: {{{

let s:win = has("win16") || has("win32") || has("win64")

" }}}

" Initialize Plugins: {{{

" PrePlugin Setup: {{{
" Get the user runtime path which is usually fist in the rtp setting.
let g:user_rtp = split(&rtp, ',')[0]
" Plugin paths live here.
let s:user_plugin_path = g:user_rtp . '/plugins'

if !has('nvim')
  set nocompatible " Disable vi compatibility
endif

filetype off " required for some Debian distributions
" }}}

" Plugin Setup: {{{
call plug#begin(s:user_plugin_path)

" Sensible Defaults:
Plug 'tpope/vim-sensible'

" Cosmetic Plugins:
Plug 'rakr/vim-one'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" You Complete Me:
if !s:win
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
if s:win
  Plug 'ctrlpvim/ctrlp.vim'
else
  " FZF from: https://github.com/junegunn/fzf
  " See https://github.com/junegunn/fzf#using-git for information on how to
  " install FZF locally.
  Plug expand('~/.fzf')
endif

Plug 'scrooloose/nerdtree'

" Tmux specific scripts
if !s:win
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
Plug 'sheerun/vim-polyglot'

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
if !s:win
  Plug 'kergoth/vim-bitbake'
endif

" Python Support:
if s:win
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

" Latex mode
if has('mac')
  Plug 'vim-scripts/TeX-9', { 'for': [ 'LaTeX', 'tex' ] }
endif

" Local overrides

Plug g:user_rtp . 'local'

call plug#end()
" }}}
" }}}

" Settings: {{{

" Airline Settings:
let g:airline_powerline_fonts = 1
let g:airline#extensions#syntastic#enabled = 1
let g:airline_skip_empty_seciton = 1
let g:airline#extensions#virtualenv#enabled = 1

runtime! plugin/sensible.vim
" " Override Sensible:
set ttimeoutlen=0

" Status_Line:

" fall back on fugitive status line unless the gui is running.
if !has('gui_running')
  set statusline=%f%m\ %{fugitive#statusline()}%<%r%w%y[%{&ff}]%=%p%%\ %L,%l,%v\
endif

" Directory Settings:
" These settings ensure that .swp and backup files all live in a temporary
" directory.

set directory^=~/tmp,/tmp,$TMP
set backupdir^=~/tmp,/tmp,$TMP

" General Options: {{{
"
set tabpagemax=30
set novisualbell " Don't display a visual bell.

"Always indent 2 spaces unless an indent file specifies otherwise.
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

" Show line numbers in all files.

set number

" Window_Preferences:
set noequalalways " no auto equal
set hidden  " hide buffers, don't kill them

" }}}

" Color Settings: {{{

" Enable True Colors: {{{
" Try using True Colors if available.

" For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
if !s:win && (has("nvim"))
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

" For Neovim > 0.1.5 and Vim > patch 7.4.1799
" < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
" Based on Vim patch 7.4.1770 (`guicolors` option)
" < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
" < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
if !s:win && (has("termguicolors"))
  set termguicolors
endif
" }}}

" My prefered colorcheme is vim-one

set background=dark
" for mobaxterm

if !s:win && has('gui_running')
  set background=light
endif

" Set the color scheme to one
" Errors in init.vim will cause Neovim to fail at startup on Windows.
silent! colorscheme one

" }}}

" Assembly Language Type: Assume we are using ARM

let g:asmsyntax="armasm"

" Python Syntax:
let python_highlight_all = 1

" }}}

" Custom Mappings: {{{

" Leader: {{{
let mapleader=',' " Fix <Leader> which for some reason is never properly set.
let maplocalleader=';'
" }}}

" Auto_Format: {{{
" Type 'QQ' to format/indent a paragraph.
map Q gq
" }}}

" Alternate File View: {{{
map <leader>a :A<CR><CR>
" }}}

" Invisible_Characters: {{{
" On linux or in unicode environments we can use pretty symbols for invisible
" characters.
if !exists("g:didSetEncoding")
  set encoding=utf-8
  let g:didSetEncoding=1
endif

if !s:win
  " Use the same symbols as TextMate for tabstops and EOLs
  set listchars=tab:▸\ ,eol:¬,trail:☠
  " set listchars=tab:»\ ,eol:¶,trail:§
else
  set listchars=tab:»\ ,eol:¶,trail:§
endif

" Shortcut to rapidly toggle `set list` (,j) is the command in normal mode.
nmap <leader>j :setlocal list!<CR>
" }}}

" }}}

" Plugins: {{{

" Polyglot: {{{

" Assume we have a set of disabled langues (append to this list with reasoning
" as needed)
let g:polyglot_disabled = []

" Default python syntax is better than polyglot
let g:polyglot_disabled += ['python']

" Prefer TeX_9 to polyglot
" Prefer fugitive to polyglot
" Don't use JSON5
let g:polyglot_disabled += ['git', 'latex', 'json5']

" JSON Configuration:
let g:vim_json_syntax_conceal = 0

" }}}

" EditorConfig: {{{

" Play nice with fugitive.vim
let g:EditorConfig_exclude_patterns = ['fugitive://.*']

" }}}

" NERDTree: {{{
let NERDTreeHijackNetrw = 0

"" NERDTree configuration
let g:NERDTreeChDirMode=2
let g:NERDTreeIgnore=['\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__']
let g:NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
set wildignore+=*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite

nnoremap <silent> <F2> :NERDTreeFind<CR>

" Type ,d to toggle NERDTree.
nmap <Leader>d :NERDTreeToggle<CR>

" }}}

" NERDCommenter: {{{

" Make comments prettier and easier to toggle See :help NERDCommenter for
" bindings.
let NERDSpaceDelims = 1

"}}}

" DelimitMate: {{{
" See :help delimitMate for explanations.
let delimitMate_expand_space = 1
let delimitMate_expand_cr = 1
set backspace=eol,start,indent

" }}}

" A_vim: {{{
"
let g:alternateSearchPath = join([
      \'sfr:../source',
      \'sfr:../include',
      \'sfr:../code',
      \'sfr:../includes',
      \'sfr:../../code',
      \'sfr:../include/private',
      \'sfr:../include/public',
      \'sfr:../includes/private',
      \'sfr:../includes/public',
      \'sfr:../src',
      \'sfr:../inc'
      \ ], ',')

" }}}

" TeX_9: {{{
" Build PDFs of LaTeX projects
let g:tex_flavor = "pdflatex"

" On Mac environments use "open *.pdf" to open the results.
if has('mac')
  let g:tex_nine_config = {
        \'compiler': 'pdflatex',
        \'viewer': {'app': 'open', 'target': 'pdf'}
        \ }
endif
"}}}

" Ctrlp: {{{
" Only support this on windows where I don't have FZF installed.
if s:win
  " typeahead search the quickfix window, buffer tags.
  let g:ctrlp_extensions = ['quickfix', 'buffertag', 'rtscript']
  " Ignore target directories, binary data, and version control.
  let g:ctrlp_custom_ignore = {
        \ 'dir':  '\.git$\|\.hg$\|\.svn$\|out$\|boost$',
        \ 'file': '\.exe$\|\.obj$\|\.dll\|\.bin\|\.hex\|\.map\|\.tmp\|\.axf\|\.so$\|\.o$',
        \ }
  " Unlimited File depth.
  let g:ctrlp_max_files = 0

  " Maximum 40 filesystem recursions.
  let g:ctrlp_max_depth = 40

  " Double the height of the window at the bottom of the screen.
  let g:ctrlp_max_height = 20
endif
"}}}

" JediVim: {{{
" Only support this on windows where I don't have YCM installed.
if s:win
  let g:jedi#popup_on_dot = 0
  let g:jedi#goto_assignments_command = "<leader>a"
  let g:jedi#goto_definitions_command = "<leader>g"
  let g:jedi#documentation_command = "K"
  let g:jedi#usages_command = "<leader>n"
  let g:jedi#rename_command = "<leader>r"
  let g:jedi#show_call_signatures = "0"
  let g:jedi#completions_command = "<C-Space>"
  let g:jedi#smart_auto_mappings = 0
endif
" }}}

" Fugitive Settings And Fixes: {{{
" Delete fugitive buffers when we close them. Otherwise this pollutes the
" buffers list.
autocmd BufReadPost fugitive://* set bufhidden=delete
"}}}

" TagList: {{{
" Sort TagsList by name not by file order
let g:Tlist_Sort_Type = "name"

" open the TagsList on the right hand side of the window.
let g:Tlist_Use_Right_Window = 1

" Type ",t" in normal mode to pull open the tabs list.
nmap <Leader>t :TlistToggle<CR>
"}}}

" UltiSnips: {{{

" Use Tab and shift+tab to navigate through tabstops
let g:UltiSnipsExpandTrigger="<C-j>"
let g:UltiSnipsJumpForwardTrigger="<C-j>"
let g:UltiSnipsJumpBackwardTrigger="<C-k>"
let g:UltiSnipsSnippetDirectories=["UltiSnips"]

" }}}

" Syntastic: {{{

" Settings:
let g:syntastic_always_populate_loc_list=1
if !s:win
  let g:syntastic_error_symbol='✗'
  let g:syntastic_warning_symbol='⚠'
  let g:syntastic_style_error_symbol = '✗'
  let g:syntastic_style_warning_symbol = '⚠'
endif
let g:syntastic_auto_loc_list=1
let g:syntastic_aggregate_errors = 1

" Linters:
let g:syntastic_python_checkers=['python', 'pylint']
" }}}

" }}} end plugins.

" Doxygen Comments: {{{
" Fix Doxygen auto brief highlighting so that it stops on more punctuation
" than simply a '.'
let g:doxygen_end_punctuation='[.?!]'
" }}}

" Auto Commands: {{{

" Treat .dox files as "Doxygen" files.
autocmd Bufread *.dox set filetype=doxygen

" Set fold methods for vimrc for easier navigation.
autocmd Bufread vimrc set foldmethod=marker
autocmd Bufread .vimrc set foldmethod=marker
autocmd Bufread _vimrc set foldmethod=marker
autocmd Bufread init.vim set foldmethod=marker
autocmd Bufread ginit.vim set foldmethod=marker

" }}}
