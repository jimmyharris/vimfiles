" support the Notes aliases in my zshkit.
augroup markdown_nodes_group
  autocmd!
  autocmd Bufread,BufNewFile $HOME/Notes/*.txt set ft=markdown
augroup end
