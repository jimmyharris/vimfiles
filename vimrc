" Vimrc by James Harris.

" Initialize Pathogen:
" {{{

set nocompatible " Disable vi compatibility

filetype off " required for some debian distributions

"disable plugins

let g:pathogen_disabled = ['snipmate', 'snipmate-snippets']

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

" Directory Settings:

set directory^=~/tmp,/tmp,$TMP
set backupdir^=~/tmp,/tmp,$TMP

" Mouse:
" FIXME: Integrate me with the OSX clipboard.

set mouse=a


" General Options:
" {{{
set nohlsearch
set ts=2
set sw=2
set sts=2
set number
" }}}

" Window_Preferences:
set noea " no auto equal
set hid  " hide buffers, don't kill them

" Color Settings:
" {{{


" Italics are terrible on windows.

if s:win
  let g:solarized_italic="off"
endif

colorscheme solarized

set background=dark

if !s:win && has('gui_running')
  set background=light
else
  let g:CSApprox_verbose_level=0 " Silence CSApprox (I know i don't have gvim support builtin)
  if !s:win                                         " Windows requires this separate
    if !exists("$TERM_PROGRAM")
      if exists("t_co") && &t_co > 255      " We have Pretty Colors
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


" Auto_Format:
map Q gq

" Invisible_Characters:
if !s:win
" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬

endif

" Shortcut to rapidly toggle `set list`
nmap <leader>j :set list!<CR>

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
nmap <Leader>d :NERDTreeToggle<CR>

" NERDCommenter:
" Make comments prettier and easier to toggle
let NERDSpaceDelims = 1


" DelimitMate:
"
let delimitMate_expand_space = 1
let delimitMate_expand_cr = 1
set backspace=eol,start,indent

" TeX_9:

let g:tex_flavor = "pdflatex"

if has('mac')
  let g:tex_viewer = {'app': 'open', 'target': 'pdf'}
endif

" Ctrlp:

let g:ctrlp_extensions = ['quickfix', 'buffertag', 'rtscript']
let g:ctrlp_custom_ignore = {
      \ 'dir':  '\.git$\|\.hg$\|\.svn$\|out\\waf$\|out/waf$',
      \ 'file': '\.exe$\|\.obj$\|\.dll\|\.bin\|\.hex\|\.map\|\.tmp\|\.axf\|\.o$',
      \ }
let g:ctrlp_max_files = 0

let g:ctrlp_max_depth = 40

let g:ctrlp_max_height = 20
" Fugitive Settings And Fixes:

autocmd BufReadPost fugitive://* set bufhidden=delete

" TagsList:

nmap <Leader>t :TlistToggle<CR>

" UltiSnips:

" Use Tab and shift+tab to navigate through tabstops
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" }}}
" Doxygen Comments:
" {{{
let g:load_doxygen_syntax=1
" }}}

" Auto Commands:
" {{{
" Set file types
autocmd Bufread *.as set filetype=actionscript
autocmd Bufread *.dox set filetype=doxygen

" Set fold methods
au Bufread vimrc set foldmethod=marker
au Bufread .vimrc set foldmethod=marker
au Bufread _vimrc set foldmethod=marker

" Remove Trailing whitespace
autocmd BufWritePre * :%s/\s\+$//e


" }}}

" Tag Paths:
" {{{

" This Tag.

set tags=tags

" }}}

" Cscope:
" {{{

if has('cscope')
  set cscopetag cscopeverbose

  if has('quickfix')
    set cscopequickfix=s-,c-,d-,i-,t-,e-
  endif

  cnoreabbrev csa cs add
  cnoreabbrev csf cs find
  cnoreabbrev csk cs kill
  cnoreabbrev csr cs reset
  " cnoreabbrev css cs show
  cnoreabbrev csh cs help

  command -nargs=0 Cscope cs add ./cscope.out

function! LoadCscope()
  let db = findfile("cscope.out", ".;")
  if (!empty(db))
    let path = strpart(db, 0, match(db, "/cscope.out$"))
    set nocscopeverbose " suppress 'duplicate connection' error
    exe "cs add " . db . " " . path
    set cscopeverbose
  endif
endfunction

au BufEnter /* call LoadCscope()

endif
" }}}
