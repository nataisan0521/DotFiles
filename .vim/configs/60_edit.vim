"Tab系
    
" Tabを半角スペースにする
set expandtab
" 行頭以外のTab文字の表示幅(スペースいくつ分)
set tabstop=4
" 行頭でのTab文字の表示幅
set shiftwidth=4

" 検索系
" 検索文字列が小文字の場合は大文字小文字を区別なく検索する
set ignorecase
" 検索文字列に大文字が含まれている場合は区別して検索する
set smartcase
" 検索文字列入力時に順次対象文字列にヒットさせる
set incsearch
" 検索時に最後まで行ったら最初に戻る
set wrapscan
" 検索語をハイライト表示
set hlsearch
" ESC連打でハイライト解除
nmap <Esc><Esc> :nohlsearch<CR><Esc>

" neocomplete
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_ignore_case = 1
let g:neocomplete#enable_smart_case = 1
if !exists('g:neocomplete#keyword_patterns')
  let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns._ = '\h\w*'
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"

" neosnippet
let g:neosnippet#snippets_directory='~/.vim/dein/repos/github.com/Shougo/neosnippet-snippets/neosnippets'
imap <C-k>  <Plug>(neosnippet_expand_or_jump)
smap <C-k>  <Plug>(neosnippet_expand_or_jump)
xmap <C-k>  <Plug>(neosnippet_expand_target)

smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "<TAB>"

" smartchr
inoremap <buffer> <expr> = smartchr#loop(' = ', ' == ', '=')
inoremap <buffer> <expr> + smartchr#loop(' + ', '+')
inoremap <buffer> <expr> - smartchr#loop(' - ', '-')
inoremap <buffer> <expr> , smartchr#loop(', ', ',')
inoremap <buffer> <expr> . smartchr#loop('.', '<%=  %>', '<%  %>')
inoremap <buffer> <expr> ( smartchr#loop('()', ' ()', '(')
inoremap <buffer> <expr> { smartchr#loop('{}', ' {}', '{<NL><NL>}')


