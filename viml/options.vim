" init.vim/Vimrc by James Harris.

" Settings: {{{

runtime! plugin/sensible.vim

" Status_Line:

" fall back on fugitive status line unless the gui is running.
if !has('gui_running')
  set statusline=%f%m\ %{fugitive#statusline()}%<%r%w%y[%{&ff}]%=%p%%\ %L,%l,%v\
endif

" Clipboard settings, always use clipboard for all delete, yank change, put
" operations, see https://stackoverflow.com/q/30691466/6064933
if !empty(provider#clipboard#Executable())
  set clipboard+=unnamedplus
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

" Leader: {{{
let mapleader=',' " Fix <Leader> which for some reason is never properly set.
let maplocalleader=';'
" }}}

" }}}

" Color Settings: {{{

" Enable True Colors: {{{
" Try using True Colors if available.

" For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
if !g:is_windows && (has("nvim"))
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

" For Neovim > 0.1.5 and Vim > patch 7.4.1799
" < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
" Based on Vim patch 7.4.1770 (`guicolors` option)
" < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
" < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
if !g:is_windows && (has("termguicolors"))
  set termguicolors
endif
" }}}

" My prefered colorcheme is vim-one

set background=dark
" for mobaxterm

if !g:is_windows && has('gui_running')
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

" Auto Commands: {{{
" Put these in a group so that we don't repeatedly add them on subequent
" reloads
augroup init_vim_autocommands
" Treat .dox files as "Doxygen" files.
  autocmd!
  autocmd Bufread *.dox set filetype=doxygen

  " Set fold methods for vimrc for easier navigation.
  autocmd Bufread vimrc set foldmethod=marker
  autocmd Bufread .vimrc set foldmethod=marker
  autocmd Bufread _vimrc set foldmethod=marker
  autocmd Bufread init.vim set foldmethod=marker
  autocmd Bufread ginit.vim set foldmethod=marker

  " Delete fugitive buffers when we close them. Otherwise this pollutes the
  " buffers list.
  autocmd BufReadPost fugitive://* set bufhidden=delete
augroup end

" }}}

