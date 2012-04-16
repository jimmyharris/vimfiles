set completeopt=menu,menuone
" -- configs --
let OmniCpp_MayCompleteDot = 1 " autocomplete with .
let OmniCpp_MayCompleteArrow = 1 " autocomplete with ->
let OmniCpp_MayCompleteScope = 1 " autocomplete with ::
let OmniCpp_SelectFirstItem = 2 " select first item (but don't insert)
let OmniCpp_NamespaceSearch = 2 " search namespaces in this and included
files
let OmniCpp_ShowPrototypeInAbbr = 1 " show function prototype (i.e.
                                    " parameters) in popup window

set foldmethod=syntax
nmap <Tab> :A<CR><CR>
" -- ctags --
" map <ctrl>+F12 to generate ctags for current folder:
map <F5> :!ctags -R --languages="C,C++,ASM" --c++-kinds=+p --fields=+iaS --extra=+q .<CR><CR>
" add current directory's generated tags file to available tags

let &tags=&tags.','.g:os_tag_path.'opengl'
let &tags=&tags.','.g:os_tag_path.'glut'
