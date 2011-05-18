" Fixing this:

let OmniCpp_NamespaceSearch = 2

" add current directory's generated tags file to available tags
let &tags = &tags.','.g:tag_path.'cpp'
let &tags = &tags.','.g:tag_path.'ni'
let &tags = &tags.','.g:tag_path.'nite'
let &tags = &tags.','.g:tag_path.'cinder'
let &tags = &tags.','.g:tag_path.'boost'
