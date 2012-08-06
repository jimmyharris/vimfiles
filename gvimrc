"set co=96
"set lines=74
"set gfn=ProFontWindows:h12.00
let s:win = has("win16") || has("win32") || has("win64")
if s:win
  set gfn=Lucida_Console:h9
  set go-=m
  set go-=T
  set go-=r
  set go-=L
else
  set gfn=Menlo:h12
endif
"set transparency=10

