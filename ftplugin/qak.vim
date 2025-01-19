" QAK file-specific configuration

" Tabs and spaces settings (tabs as 4 spaces)
setlocal expandtab       " Replace tabs with spaces
setlocal shiftwidth=4    " Auto-indent uses 4 spaces
setlocal tabstop=4       " Tabs visually align to 4 spaces
setlocal softtabstop=4   " Backspace treats 4 spaces as one tab
"
" " Preserve syntax highlighting while showing whitespace
" setlocal list            " Enable visible whitespace
" setlocal listchars=tab:→\ ,trail:· " Show tabs as '→' followed by a space, and trailing spaces as '·'

" Ensure syntax highlighting works
if !exists("b:current_syntax")
    runtime! syntax/qak.vim
endif

