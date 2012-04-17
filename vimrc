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

" Detect Windows:
" {{{

let s:win = has("win16") || has("win32") || has("win64")

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

colorscheme solarized

if s:win
  set background=dark
  if has('gui_running')
    let g:solarized_italic=0
    let g:solarized_contrast="high"
    let g:solarized_visibility="high"
  endif
else
  if has('gui_running')
    set background=light
  else
    let g:CSApprox_verbose_level=0 " Silence CSApprox (I know i don't have gvim support builtin)
    set background=dark
    if !s:win 
      if !exists("$TERM_PROGRAM") && &t_co > 255      " We have Pretty Colors
        let g:solarized_termcolors=256
      endif
    endif
  endif
endif


" }}}

" Assembly Language Type:

let g:asmsyntax="armasm"

" }}}

" Custom Mappings: 
" {{{

" Leader: 
" {{{
let mapleader=',' " Fix <Leader> which for some reason is never properly set.
let maplocalleader=';' 
" }}}

" CtagsMapping:

map <F5> :!ctags -R --exclude=.svn --exclude=.git --exclude=log --languages="C,C++" * <CR>

" Ctrlp:

let g:ctrlp_extensions = ['tag', 'buffertag', 'quickfix', 'dir', 'changes' ]

" Auto_Format:
map Q gq

" Invisible_Characters:
if !s:win
" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬

" Shortcut to rapidly toggle `set list`
nmap <leader>j :set list!<CR>
endif

" }}}

" Plugins: 
" {{{

let mapleader=','

" Tabularize:

if exists(":Tabularize")
  nmap <Leader>= :Tabularize /=<CR>
  vmap <Leader>= :Tabularize /=<CR>
  nmap <Leader>: :Tabularize /:\zs<CR>
  vmap <Leader>: :Tabularize /:\zs<CR>
endif


" NERDTree:

let NERDTreeHijackNetrw = 0

" NERDCommenter:
" Make comments prettier and easier to toggle
let NERDSpaceDelims = 1


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
autocmd BufWritePre *.c :%s/\s\+$//e
autocmd BufWritePre *.h :%s/\s\+$//e
autocmd BufWritePre *.cpp :%s/\s\+$//e
autocmd BufWritePre *.hpp :%s/\s\+$//e

" }}}

" Tag Paths:
" {{{

" This Tag.

set tags=tags

if s:win
  let g:OS = "win"
  let g:tag_path = $HOME.'\vimfiles\tags\'
  let g:os_tag_path = g:tag_path.g:OS.'\'
else
  let g:OS = substitute(system('uname'),"\n","","")
  let g:tag_path = $HOME.'/.vim/tags/'
  let g:os_tag_path = g:tag_path.g:OS.'/'
endif

" }}}
