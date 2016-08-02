function! s:DetectJS()
    if getline(1) =~# '^#!.*/bin/\(env\s\+\)\?node\>'
        setfiletype javascript
    endif
endfunction
autocmd BufNewFile,BufRead * call s:DetectJS()
" Detect syntax file.
autocmd BufNewFile,BufRead *.snip,*.snippets set filetype=neosnippet
