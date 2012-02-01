" Vimrc by James Harris.

" Initialize Pathogen: 
" {{{

set nocompatible " Disable vi compatibility

filetype off " required for some debian distributions

"disable plugins

let g:pathogen_disabled = ['LaTeX-Box']

call pathogen#runtime_append_all_bundles() " Load pathogen bundles.

call pathogen#helptags() " Set up documenation for all the bundles

syntax on " Turn on FT Plugins and syntax hilighting. 
filetype plugin indent on

" }}}

" Settings:
" {{{

" Status_Line: 

set laststatus=2
set statusline=%f%m\ %{fugitive#statusline()}%<%r%w%y[%{&ff}]%=%p%%\ %L,%l,%v\ 

" Mouse:
" FIXME: Integrate me with the OSX clipboard.

set mouse=a


" General Options:
" {{{
set nohlsearch 
set ts=2
set sw=2
set sts=2
set et
set number
" }}}

" Window_Preferences:
set noea " no auto equal
set hid  " hide buffers, don't kill them

" Color Settings: 
" {{{


if has('gui_running')
  set background=light
else
  let g:CSApprox_verbose_level=0 " Silence CSApprox (I know i don't have gvim support builtin)
  set background=dark
  " if &t_Co > 255 " We have Pretty Colors
    " let g:solarized_termcolors=256
  " endif
endif
colorscheme solarized


" }}}

" }}}

" Custom Mappings: 
" {{{

" Leader: 
" {{{
let mapleader=',' " Fix <Leader> which for some reason is never properly set.
let maplocalleader=';' 
" }}}

" CtagsMapping:

map <F5> :!ctags -R --exclude=.svn --exclude=.git --exclude=log * <CR>

" Auto_Format:
map Q gq

" Invisible_Characters:

" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬

" Shortcut to rapidly toggle `set list`
nmap <leader>j :set list!<CR>

" }}}

" Plugins: 
" {{{

" Tabularize:

let mapleader=','

if exists(":Tabularize")
  nmap <Leader>= :Tabularize /=<CR>
  vmap <Leader>= :Tabularize /=<CR>
  nmap <Leader>: :Tabularize /:\zs<CR>
  vmap <Leader>: :Tabularize /:\zs<CR>
endif


" NERDCommenter:
" Make comments prettier and easier to toggle
let NERDSpaceDelims=1


" DelimitMate: 
let delimitMate_expand_space = 1
let delimitMate_expand_cr = 1
set backspace=eol,start,indent

" TeX_9:

let g:tex_flavor = "pdflatex"

if has('mac')
  let g:tex_viewer = {'app': 'open', 'target': 'pdf'}
endif

" }}}

" Auto Commands:
" {{{
autocmd Bufread *.as set filetype=actionscript
au Bufread vimrc set foldmethod=marker
au Bufread .vimrc set foldmethod=marker

" }}}

" Tag Paths:
" {{{

" This Tag.

set tags=./tags

let s:win = has("win16") || has("win32") || has("win64")
if s:win
  let g:OS = "win"
  let g:tag_path = $HOME.'\_vim\tags\'
  let g:os_tag_path = g:tag_path.g:OS.'\'
else
  let g:OS = substitute(system('uname'),"\n","","")
  let g:tag_path = $HOME.'/.vim/tags/'
  let g:os_tag_path = g:tag_path.g:OS.'/'
endif

" }}}
