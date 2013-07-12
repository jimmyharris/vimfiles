set fdm=marker
let delimitMate_matchpairs = "(:),[:],{:},`:'"
imap <buffer> [[ \begin{
imap <buffer> ]] <plug>LatexCloseLastEnv
nmap <buffer> <f5> <plug>LatexChangeEnv
vmap <buffer> <f7> <plug>LatexWrapSelection
vmap <buffer> <s-f7> <plug>LatexWrapSelectionEnv
map <silent> <leader>ls :silent !/Applications/Skim.app/Contents/SharedSupport/displayline <c-r>=line('.')<cr> "<c-r>=LatexBox_GetOutputFile()<cr>" "%:p" <cr>
