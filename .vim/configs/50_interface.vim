" The prefix key.
nnoremap    [unite]   <Nop>
nmap    <Leader><space> [unite]

" unite.vim keymap
" https://github.com/alwei/dotfiles/blob/3760650625663f3b08f24bc75762ec843ca7e112/.vimrc
nnoremap [unite]u  :<C-u>Unite -no-split<Space>
nnoremap <silent> [unite]f :<C-u>Unite<Space>file<CR>
nnoremap <silent> [unite]b :<C-u>Unite<Space>bookmark<CR>
nnoremap <silent> [unite]r :<C-u>UniteWithBufferDir file<CR>
nnoremap <silent> [unite]B :<C-u>Unite<Space>buffer<CR>

" unite-build map
nnoremap <silent> ,vb :Unite build<CR>
nnoremap <silent> ,vcb :Unite build:!<CR>
nnoremap <silent> ,vch :UniteBuildClearHighlight<CR>
"" }}}


"" unite-grep {{{
" unite-grepのバックエンドをagに切り替える 
" http://qiita.com/items/c8962f9325a5433dc50d
let g:unite_source_grep_command = 'ag'
let g:unite_source_grep_default_opts = '--nocolor --nogroup'
let g:unite_source_grep_recursive_opt = ''
let g:unite_source_grep_max_candidates = 200

" unite-grepのキーマップ
nnoremap [unite]<space> :split<cr> :<C-u>Unite -start-insert

" VimShell
nnoremap <silent><leader>cm :sp<C-w><C-w><C-w>:VimShell<Cr>

" VimFiler
nnoremap <silent><leader>e :VimFilerExplore -split -winwidth=30 -find -no-quit<Cr>

" memolist
let g:memolist_unite        = 1
let g:memolist_unite_source = "file_rec"
let g:memolist_unite_option = "-start-insert"
map <Leader>mn  :MemoNew<CR>
map <Leader>ml  :MemoList<CR>
map <Leader>mg  :MemoGrep<CR>

" neomru.vim
nnoremap <silent> [unite]m :<C-u>Unite<Space>file_mru<CR>

"unite-filetype
nnoremap <silent> [unite]t :<C-u>Unite<Space>filetype<CR>

"unite-outline
nnoremap <silent> [unite]o :<C-u>Unite<Space>outline<CR>



