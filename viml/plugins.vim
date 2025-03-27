scriptencoding utf-8

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

" UltiSnips: {{{

" Use Tab and shift+tab to navigate through tabstops
let g:UltiSnipsExpandTrigger="<C-j>"
let g:UltiSnipsJumpForwardTrigger="<C-j>"
let g:UltiSnipsJumpBackwardTrigger="<C-k>"
let g:UltiSnipsSnippetDirectories=["UltiSnips"]

" }}}

" vim-sandwich: {{{

" Map s to nop since s in used by vim-sandwich. Use cl instead of s.
nmap s <Nop>
omap s <Nop>

" }}}

" vim-matchup: {{{

" Improve performance
let g:matchup_matchparen_deferred = 1
let g:matchup_matchparen_timeout = 100
let g:matchup_matchparen_insert_timeout = 30

" Enhanced matching with matchup plugin
let g:matchup_override_vimtex = 1

" Whether to enable matching inside comment or string
let g:matchup_delim_noskips = 0

" Show offscreen match pair in popup window
let g:matchup_matchparen_offscreen = {'method': 'popup'}

" }}}

" }}} end plugins.
