"set columns=96
"set lines=74
"set guifont=ProFontWindows:h12.00
let s:win = has("win16") || has("win32") || has("win64")
" If we are running on windows:
if s:win
  set guifont=Sauce_Code_Powerline:h9:cANSI
  set guioptions-=m " No menu bar
  set guioptions-=T " No tool bar
  set guioptions-=r " No righthand scroll bar
  set guioptions-=L " No lefthand scroll bar
else
  set guifont=Menlo:h12
endif
"set transparency=10

