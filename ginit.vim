"set columns=96
"set lines=74
"set guifont=ProFontWindows:h12.00
let s:win = has("win16") || has("win32") || has("win64")
if !has('nvim')
  " If we are running on windows:
  if s:win
    set enc=utf-8
    set fileencoding=utf-8
    set fileencodings=ucs-bom,utf8,prc
    set guifont=Sauce_Code_Powerline:h9:cANSI
    set guioptions-=m " No menu bar
    set guioptions-=T " No tool bar
    set guioptions-=r " No righthand scroll bar
    set guioptions-=L " No lefthand scroll bar
  else
    set guifont=Sauce_Code_Powerline:h9:cANSI
  endif
else
  " Note: I have no idea what this will do if we don't have this font
  " installed.
  GuiFont! DejaVu Sans Mono for Powerline:h9
endif
"set transparency=10

