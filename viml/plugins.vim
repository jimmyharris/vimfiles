scriptencoding utf-8

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

" Plugin specification and lua stuff
lua require('plugin_specs')

" Use short names for common plugin manager commands to simplify typing.
" To use these shortcuts: first activate command line with `:`, then input the
" short alias, e.g., `pi`, then press <space>, the alias will be expanded to
" the full command automatically.
call utils#Cabbrev('pi', 'Lazy install')
call utils#Cabbrev('pud', 'Lazy update')
call utils#Cabbrev('pc', 'Lazy clean')
call utils#Cabbrev('ps', 'Lazy sync')

" Plugins: {{{


" EditorConfig: {{{

" Play nice with fugitive.vim
let g:EditorConfig_exclude_patterns = ['fugitive://.*']

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
      \'sfr:../inc',
      \'sfr:../Source',
      \'sfr:../Include',
      \'sfr:../Code',
      \'sfr:../Includes',
      \'sfr:../../Code',
      \'sfr:../Include/Private',
      \'sfr:../Include/Public',
      \'sfr:../Includes/Private',
      \'sfr:../Includes/Public'
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
if g:is_windows
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
if g:is_windows
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
" Always populate the location list
let g:syntastic_always_populate_loc_list=1
" Use fancy unicode on windows.
if !g:is_windows
  let g:syntastic_error_symbol='✗'
  let g:syntastic_warning_symbol='⚠'
  let g:syntastic_style_error_symbol = '✗'
  let g:syntastic_style_warning_symbol = '⚠'
endif

" Aggregate errors into a single list.
let g:syntastic_aggregate_errors = 1

" Linters:

" Default to pylint.
let g:syntastic_python_checkers = ['python', 'pylint']

" Use shellcheck for shell scripts
let g:syntastic_sh_checkers = ['shellcheck']

" Disable some common errors that might be too noisy for a specific file set.
" Always assume bash for sh checkers unless we are explicitly using zsh. Add
" to this list to disable specific warnings.
let s:shellcheck_disabled_warnings = [
   \'SC2086',
   \'SC1017',
   \'SC2164',
   \'SC2103',
   \'SC1090'
   \]

" Build the shellcheck args list.
let s:shellcheck_args_list = []

" Convert shellcheck warnings into arguments.
for warning in s:shellcheck_disabled_warnings
  let s:shellcheck_args_list += [join(['-e', warning])]
endfor

" set the shellcheck args for the sh file type (assume we are bash even for
" .sh scripts.)
let g:syntastic_sh_shellcheck_args = join(s:shellcheck_args_list + ['-s', 'bash'])

" }}}

" Ack:
" {{{
if !g:is_windows && executable('ag')
  let g:ackprg = 'ag --nogroup --nocolor --column'
endif
" }}}
"
" }}} end plugins.
