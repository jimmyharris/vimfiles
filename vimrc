" Vimrc by James Harris.

" Initialize Pathogen:
" {{{

set nocompatible " Disable vi compatibility

filetype off " required for some Debian distributions

"disable plugins

let g:pathogen_disabled = [
      \ 'OmniCppComplete',
      \ 'rails',
      \ 'rvm',
      \ 'dbext'
      \ ]

call pathogen#runtime_append_all_bundles() " Load pathogen bundles.

call pathogen#helptags() " Set up documentation for all the bundles

syntax on " Turn on FT Plug-ins and syntax highlighting.
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
" These settings ensure that .swp and backup files all live in a temporary
" directory.

set directory^=~/tmp,/tmp,$TMP
set backupdir^=~/tmp,/tmp,$TMP

" Mouse:
set mouse=a


" General Options:
" {{{
"
set tabpagemax=30
set nohlsearch " Don't highlight the words I am searching for

"Always indent 2 spaces unless an indent file specifies otherwise.
set ts=2
set sw=2
set sts=2
set et

" comments should be spell-checked.
set spell

" Show line numbers in all files.

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

" My preferred color scheme is solarized. This can be set to anything in the
" Colors directory.

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

if exists(":Tabularize")
	" Tabularize on '='. Good for aligning assignment of variables.
  nmap <Leader>= :Tabularize /=<CR>
  vmap <Leader>= :Tabularize /=<CR>
	" tabularize on ':'. This does not center the : in the tabularization.
	" Good for JSON formatting.
  nmap <Leader>: :Tabularize /:\zs<CR>
  vmap <Leader>: :Tabularize /:\zs<CR>
endif


" NERDTree:

let NERDTreeHijackNetrw = 0

" Type ,d to toggle NERDTree.
nmap <Leader>d :NERDTreeToggle<CR>


" NERDCommenter:
" Make comments prettier and easier to toggle See :help NERDCommenter for
" bindings.
let NERDSpaceDelims = 1


" DelimitMate:
" See help delimitMate for explanations.
let delimitMate_expand_space = 1
let delimitMate_expand_cr = 1
set backspace=eol,start,indent

" TeX_9:

" Build PDFs of LaTeX projects
let g:tex_flavor = "pdflatex"

" On Mac environments use "open *.pdf" to openthe results.
if has('mac')
  let g:tex_viewer = {'app': 'open', 'target': 'pdf'}
endif

" Ctrlp:

" typeahead search the quickfix window, buffer tags.
let g:ctrlp_extensions = ['quickfix', 'buffertag', 'rtscript']
" Ignore target directories, binary data, and version control.
let g:ctrlp_custom_ignore = {
      \ 'dir':  '\.git$\|\.hg$\|\.svn$\|out\\waf$\|out/waf$',
      \ 'file': '\.exe$\|\.obj$\|\.dll\|\.bin\|\.hex\|\.map\|\.tmp\|\.axf\|\.o$',
      \ }
" Unlimited File depth.
let g:ctrlp_max_files = 0

" Maximum 40 filesystem recursions.
let g:ctrlp_max_depth = 40

" Double the height of the window at the bottom of the screen.
let g:ctrlp_max_height = 20

" Fugitive Settings And Fixes:

" Delete fugitive buffers when we close them. otherwise this polutes the
" buffers list.
autocmd BufReadPost fugitive://* set bufhidden=delete

" TagsList:

" Type ",t" in normal mode to pull open the tabs list.
nmap <Leader>t :TlistToggle<CR>

" UltiSnips:

" Use Tab and shift+tab to navigate through tabstops
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" }}}

" Doxygen Comments:
" {{{

" Fix Doxygen auto brief highlighting so that it stops on more punctuation
" than simply a '.'
let g:doxygen_end_punctuation='[.?!]'
" }}}

" Auto Commands:
" {{{
" Set file types
autocmd Bufread *.as set filetype=actionscript

" Treat .dox files as "Doxygen" files.
autocmd Bufread *.dox set filetype=doxygen

" Set fold methods for vimrc for easier navigation.
au Bufread vimrc set foldmethod=marker
au Bufread .vimrc set foldmethod=marker
au Bufread _vimrc set foldmethod=marker


" Remove Trailing Whitespace:
" Caution! this can cause whitespace conflicts on files created by other
" people.
autocmd BufWritePre * :%s/\s\+$//e

" }}}

" Tag Paths:
" {{{

" Local tagpaths.

set tags=tags

" }}}

