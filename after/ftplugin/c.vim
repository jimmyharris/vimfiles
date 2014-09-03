setlocal foldmethod=syntax
setlocal list
setlocal spell
let b:load_doxygen_syntax=1

" Cscope:
" {{{
" bindings and abbreviations for cscope searches.

if has('cscope')
  set cscopetag cscopeverbose

  if has('quickfix')
    set cscopequickfix=s-,c-,d-,i-,t-,e-
  endif

  cnoreabbrev csa cs add
  cnoreabbrev csf cs find
  cnoreabbrev csk cs kill
  cnoreabbrev csr cs reset
  cnoreabbrev csh cs help

  command! -nargs=0 Cscope cs add ./cscope.out

endif
" }}}
