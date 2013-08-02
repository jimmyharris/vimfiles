" set completeopt=menu,menuone
" -- configs --
" let OmniCpp_MayCompleteDot = 1 " autocomplete with .
" let OmniCpp_MayCompleteArrow = 1 " autocomplete with ->
" let OmniCpp_MayCompleteScope = 1 " autocomplete with ::
" let OmniCpp_SelectFirstItem = 2 " select first item (but don't insert)
" let OmniCpp_NamespaceSearch = 2 " search namespaces in this and included
" files
" let OmniCpp_ShowPrototypeInAbbr = 1 " show function prototype (i.e.
                                    " " parameters) in popup window

setlocal foldmethod=syntax
setlocal list
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

  command -nargs=0 Cscope cs add ./cscope.out

endif
" }}}
