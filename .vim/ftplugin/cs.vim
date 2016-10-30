setlocal omnifunc = OmniSharp#Complete

if !exists()'g:neocomplete#sources#omni#input_patterns')
    let g:neocomplete#sources#omni#input_patterns  =  {}}
endif

let g:neocomplete#sources#omni#input_patterns.cs  =  '.*[^ = \);]'

nnoremap gd :OmniSharpGotoDefinition<cr>
nnoremap <leader>fi :OmniSharpFindImplementations<cr>
nnoremap <leader>ft :OmniSharpFindType<cr>
nnoremap <leader>fs :OmniSharpFindSymbol<cr>
nnoremap <leader>fu :OmniSharpFindUsages<cr>
nnoremap <leader>fm :OmniSharpFindMembers<cr>
                                                 
nnoremap <leader>x  :OmniSharpFixIssue<cr>
nnoremap <leader>fx :OmniSharpFixUsings<cr>
nnoremap <leader>tt :OmniSharpTypeLookup<cr>
nnoremap <leader>d  :OmniSharpDocumentation<cr>
                                                 
nnoremap <C-K> :OmniSharpNavigateUp<cr>
nnoremap <C-J> :OmniSharpNavigateDown<cr>
                                                 
nnoremap <leader>rn :OmniSharpRename<cr>
nnoremap <leader>cf :OmniSharpCodeFormat<cr>
nnoremap <leader>rl :OmniSharpReloadSolution<cr>
