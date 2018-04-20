" These configurations must occur after plugins load in order to insure that
" we can detect if a plugin was loaded or not.
" YouCompleteMe:
" {{{

" Only do this if we have loaded YouCompleteMe
if exists("g:loaded_youcompleteme")
  " setup YouCompleteMe settings.
  let g:ycm_collect_identifiers_from_tags_files = 0
  let g:ycm_confirm_extra_conf = 0
  let g:ycm_autoclose_preview_window_after_completion = 1
  let g:ycm_autoclose_preview_window_after_insertion = 1
  let g:ycm_filepath_completion_use_working_dir = 1
  let g:ycm_enable_diagnostic_highlighting = 1
  let g:ycm_complete_in_strings = 1
  let g:ycm_complete_in_comments = 1

  " Fix interactions with delimitMate and YouCompleteMe
  " See
  " https://github.com/Valloric/YouCompleteMe/issues/2696#issuecomment-334439999
  " for workaround details.
  if exists("g:loaded_delimitMate")
    imap <silent> <BS> <C-R>=YcmOnDeleteChar()<CR><Plug>delimitMateBS

    function! YcmOnDeleteChar()
      if pumvisible()
        return "\<C-y>"
      endif
      return "" 
    endfunction
  endif
endif
" }}}

" Tabularize:
" {{{
if exists(":Tabularize")
  " Tabularize on '='. Good for aligning assignment of variables.
  nmap <Leader>= :Tabularize /=<CR>
  vmap <Leader>= :Tabularize /=<CR>
  " tabularize on ':'. This does not center the : in the tabularization.
  " Good for JSON formatting.
  nmap <Leader>: :Tabularize /:\zs<CR>
  vmap <Leader>: :Tabularize /:\zs<CR>
endif
" }}}

