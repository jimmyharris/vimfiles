" Ansible detection
augroup ansible_ft
  autocmd!
  au BufRead,BufNewFile */playbooks/*.yml set filetype=yaml.ansible
  au BufRead,BufNewFile */playbooks/*.yaml set filetype=yaml.ansible
  au BufRead,BufNewFile */roles/*.yml set filetype=yaml.ansible
  au BufRead,BufNewFile */roles/*.yaml set filetype=yaml.ansible
augroup end
