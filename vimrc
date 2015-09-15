" Vimrc by James Harris.

" Detect Windows:
" {{{

let s:win = has("win16") || has("win32") || has("win64")

" }}}

" Initialize Plugins:
" {{{

" User Runtime Path.
let g:user_rtp = split(&rtp, ',')[0]
let s:user_plugin_path = g:user_rtp . '/plugins'

if !has('nvim')
  set nocompatible " Disable vi compatibility
endif

filetype off " required for some Debian distributions

call plug#begin(s:user_plugin_path)

" Cosmetic Plugins:
Plug 'chriskempson/base16-vim', { 'do': 'colorscheme base16-default' }
Plug 'bling/vim-airline'

" Editor Improvements:
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-unimpaired'
Plug 'Raimondi/delimitMate'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-endwise', { 'for': 'lua' }
Plug 'henrik/vim-qargs', { 'on': 'Qdo' }

Plug 'vim-scripts/a.vim', { 'on': 'A' }

Plug 'godlygeek/tabular', { 'on': 'Tab' }

" Useful for everything so probably good to keep around for lua and company.
Plug 'scrooloose/nerdcommenter'

" Searching and navigating.

Plug 'kien/ctrlp.vim'

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' } |
  \Plug 'Xuyuanp/nerdtree-git-plugin', { 'on':  'NERDTreeToggle' }

" This creates an actual list of tags so it is more useful than tagbar.
Plug 'vim-scripts/taglist.vim', { 'on': 'TListToggle' }

Plug 'vim-scripts/genutils' | Plug 'vim-scripts/SelectBuf'

" Building

Plug 'tpope/vim-dispatch', { 'on': 'Make' }
Plug 'benekastah/neomake', { 'on': 'Neomake' }

if s:win
  Plug '$HOME/vimfiles/local'
else
  Plug '$HOME/.vim/local'
endif

" Autocomplete and snippets

if has('nvim')
  Plug 'Shougo/deoplete.nvim'
else " This requires if_lua which we son't have in neovim
  Plug 'Shougo/neocomplete'
endif

Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" FileType Plugins:

" Useful for HTML and XML
Plug 'tpope/vim-ragtag'
" Useful for Json
Plug 'jakar/vim-json'
Plug 'tpope/vim-jdaddy', { 'for': 'javascript' }

" Markdown syntax.
Plug 'tpope/vim-markdown', { 'for': 'markdown' }

" C++11 syntax
Plug 'vim-scripts/Cpp11-Syntax-Support', { 'for': [ 'cpp', 'c' ] }

" Lua utilities
Plug 'xolox/vim-misc' | Plug 'xolox/vim-lua-ftplugin', { 'for': 'lua' }

" Plug 'vim-scripts/TeX-9', { 'for': [ 'LaTeX', 'tex' ] }

call plug#end()

syntax on " Turn on FT Plug-ins and syntax highlighting.
filetype plugin indent on

" }}}

" Settings:
" {{{

let g:airline_powerline_fonts = 1
let g:airline#extensions#syntastic#enabled = 0

runtime! plugin/sensible.vim
" Override Sensible:
set ttimeoutlen=0

let g:airline_powerline_fonts=1

" Status_Line:

if s:win && !has('gui_running')
  set statusline=%f%m\ %{fugitive#statusline()}%<%r%w%y[%{&ff}]%=%p%%\ %L,%l,%v\
endif

" Directory Settings:
" These settings ensure that .swp and backup files all live in a temporary
" directory.

set directory^=~/tmp,/tmp,$TMP
set backupdir^=~/tmp,/tmp,$TMP

" General Options:
" {{{
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
" }}}

" Window_Preferences:
set noequalalways " no auto equal
set hidden  " hide buffers, don't kill them

" Color Settings:
" {{{

" My preferred color scheme is solarized. This can be set to anything in the
" Colors directory.

set background=dark
" for mobaxterm

if !s:win && has('gui_running')
  set background=light
else
  let g:CSApprox_verbose_level=0 " Silence CSApprox (I know i don't have gvim support builtin)
  if !s:win " Windows requires this separate
    " If I am running on mac then use the fancy 256 colorspace trick.
    if exists("$TERM_PROGRAM")
      let base16colorspace=256
    endif
  endif
endif

colorscheme base16-default

" }}}

" Assembly Language Type: Assume we are using ARM

let g:asmsyntax="armasm"

" }}}

" Custom Mappings:
" {{{

" Leader:
" {{{
let mapleader=',' " Fix <Leader> which for some reason is never properly set.
let maplocalleader=';'
" }}}


" Auto_Format:
" Type 'QQ' to format/indent a paragraph.
map Q gq

" Alternate File View:
map <leader>a :A<CR><CR>

" Invisible_Characters:
" On linux or in unicode environments we can use pretty symbols for invisible
" characters.
if !s:win
" Use the same symbols as TextMate for tabstops and EOLs
  set listchars=tab:▸\ ,eol:¬,trail:☠
else
  set encoding=utf-8
  set listchars=tab:»\ ,eol:¶,trail:§
endif

" Shortcut to rapidly toggle `set list` (,j) is the command in normal mode.
nmap <leader>j :setlocal list!<CR>

" }}}

" Plugins:
" {{{

" Tabularize:
" {{{
if exists(":Tabularize")
  " Tabularize on '='. Good for aligning assignment of variables.
  nmap <Leader>= :Tabularize /=<CR>
  vmap <Leader>= :Tabularize /=<CR>
  " tabularize on ':'. This does not center the : in the tabularization.
  " Good for JSON formatting.
  nmap <Leader>: :Tabularize /:\zs<CR>
  vmap <Leader>: :Tabularize /:\zs<CR>
endif

" }}}

" NERDTree:
" {{{
let NERDTreeHijackNetrw = 0

" Type ,d to toggle NERDTree.
nmap <Leader>d :NERDTreeToggle<CR>

" }}}

" NERDCommenter:
" {{{

" Make comments prettier and easier to toggle See :help NERDCommenter for
" bindings.
let NERDSpaceDelims = 1

"}}}

" DelimitMate:
" {{{
" See :help delimitMate for explanations.
let delimitMate_expand_space = 1
let delimitMate_expand_cr = 1
set backspace=eol,start,indent

" }}}

" A_vim:
" {{{
"
let g:alternateSearchPath = join([
  \'sfr:../source',
  \'sfr:../../code',
  \'sfr:../code',
  \'sfr:../src',
  \'sfr:../include',
  \'sfr:../include/private',
  \'sfr:../includes',
  \'sfr:../includes/private',
  \'sfr:../inc'
  \ ], ',')

" }}}

" TeX_9:
" {{{
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

" Ctrlp:
" {{{
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
"}}}

" Fugitive Settings And Fixes:
"{{{
" Delete fugitive buffers when we close them. Otherwise this pollutes the
" buffers list.
autocmd BufReadPost fugitive://* set bufhidden=delete
"}}}

" TagList:
" {{{
" Sort TagsList by name not by file order
let g:Tlist_Sort_Type = "name"

" open the TagsList on the right hand side of the window.
let g:Tlist_Use_Right_Window = 1

" Type ",t" in normal mode to pull open the tabs list.
nmap <Leader>t :TlistToggle<CR>
"}}}

" UltiSnips:
" {{{

" Use Tab and shift+tab to navigate through tabstops
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsSnippetDirectories=["UltiSnips"]

" }}}

" }}} end plugins.

" Doxygen Comments:
" {{{
" Fix Doxygen auto brief highlighting so that it stops on more punctuation
" than simply a '.'
let g:doxygen_end_punctuation='[.?!]'
" }}}

" Auto Commands:
" {{{

" Treat .dox files as "Doxygen" files.
autocmd Bufread *.dox set filetype=doxygen

" Set fold methods for vimrc for easier navigation.
autocmd Bufread vimrc set foldmethod=marker
autocmd Bufread .vimrc set foldmethod=marker
autocmd Bufread _vimrc set foldmethod=marker


" Remove Trailing Whitespace:
" Caution! This can cause whitespace conflicts on files created by other
" people.
autocmd BufWritePre * :%s/\s\+$//e

" }}}

" Tag Paths:
" {{{

" Local tagpaths.

set tags=tags

" }}}

