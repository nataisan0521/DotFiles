" :TODO インデント整理 
if has('vim_starting')
    set rtp+=~/.vim/plugged/vim-plug
    if !isdirectory(expand('~/.vim/plugged/vim-plug'))
       echo 'install vim-plug...'
       call system('mkdir -p ~/.vim/plugged/vim-plug')
       call system('git clone https://github.com/junegunn/vim-plug.git ~/.vim/plugged/vim-plug/autoload')
    end
endif

call plug#begin(expand('~/.vim/plugged/'))

    Plug 'junegunn/vim-plug',
        \ {'dir': '~/.vim/plugged/vim-plug/autoload'}
    Plug 'Shougo/vimproc', {'do': 'make'} | Plug 'Shougo/neocomplete.vim'
    Plug 'Shougo/unite.vim' | Plug 'Shougo/vimfiler'
    Plug 'Shougo/unite.vim' | Plug 'glidenote/memolist.vim'
    Plug 'Shougo/unite.vim' | Plug 'Shougo/neomru.vim'
    Plug 'Shougo/unite.vim' | Plug 'osyo-manga/unite-filetype'
    Plug 'Shougo/unite.vim' | Plug 'h1mesuke/unite-outline'
    Plug 'Shougo/unite.vim' | Plug 'basyura/unite-rails', {'for': ['rb','erb'] }
    Plug 'tpope/vim-fugitive'
    Plug 'tomasr/molokai'
    Plug 'itchyny/lightline.vim'
    Plug 'kana/vim-smartchr'
    Plug 'Shougo/neosnippet-snippets' | Plug 'Shougo/neosnippet'
    Plug 'tpope/vim-dispatch' | Plug 'OmniSharp/omnisharp-vim' ,{
                                    \ 'for': 'cs',
                                    \ 'do' : 'xbuild server/OmniSharp.sln'
                                    \ }
    Plug 'mattn/emmet-vim', {'for': ['html','css','erb']}
    Plug 'hail2u/vim-css3-syntax' , {'for': 'css'}
    Plug 'othree/html5.vim', {'for': 'html'}
    Plug 'jelera/vim-javascript-syntax', {'for': ['html','js']}
    Plug 'ujihisa/neco-ghc', {'for': 'hs'}
    Plug 'kana/vim-filetype-haskell', {'for': 'hs'}
    Plug 'eagletmt/ghcmod-vim', {'for': 'hs'}
    Plug 'altercation/vim-colors-solarized'
call plug#end()

"SpaceをLeaderにする
let mapleader = "\<Space>"
set backspace=eol,indent,start
" 文字コードをUTF-8に指定
set fenc=utf-8
scriptencoding utf-8
set encoding=utf-8
" バックアップファイルを作らない
set nobackup
" スワップファイルを作らない
set noswapfile
" 編集中のファイルが変更されたら自動で読み直す
set autoread
" バッファが編集中でもその他のファイルが開けるように
set hidden
" 入力中のコマンドをステータスに表示する
set showcmd

" 見た目系
" 行番号の表示
set number
" 行末の1文字先までカーソルを移動できるように
set virtualedit=onemore
" オートインデント
set autoindent
" インデントはスマートインデント
set smartindent
" ビープ音を可視化
set visualbell
" 括弧入力時の対応する括弧を表示
set showmatch
" ステータスラインを常に表示
set laststatus=2
" コマンドラインの補完
set wildmode=list:longest
" 折り返し時に表示行単位での移動できるようにする
nnoremap j gj
nnoremap k gk
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

" 矢印キーを無効にする
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
inoremap <Up> <Nop>
inoremap <Down> <Nop>
inoremap <Left> <Nop>

nnoremap s <Nop>
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sh <C-w>h
nnoremap sJ <C-w>J
nnoremap sK <C-w>K
nnoremap sL <C-w>L
nnoremap sH <C-w>H
nnoremap sn gt
nnoremap sp gT
nnoremap sr <C-w>r
nnoremap s= <C-w>=
nnoremap sw <C-w>w
nnoremap so <C-w>_<C-w>|
nnoremap sO <C-w>=
nnoremap sN :<C-u>bn<CR>
nnoremap sP :<C-u>bp<CR>
nnoremap st :<C-u>tabnew<CR>
nnoremap sT :<C-u>Unite tab<CR>
nnoremap ss :<C-u>sp<CR>
nnoremap sv :<C-u>vs<CR>
nnoremap sq :<C-u>q<CR>
nnoremap sQ :<C-u>bd<CR>

" 入力モードでのカーソル移動
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-h> <Left>
inoremap <C-l> <!-- <Right> -->

" 日本語入力がオンのままでも使えるコマンド(Enterキーは必要)
nnoremap あ a
nnoremap い i
nnoremap う u
nnoremap お o
nnoremap っd dd
nnoremap っy yy

";でコマンドモード起動
nnoremap ; :

syntax enable
set laststatus=2
set t_Co=256
let g:solarized_termcolors=256
let g:solarized_termtrans=1
let g:solarized_contrast="high"
set background=dark
colorscheme solarized 

if !exists('g:neocomplete#sources#omni#input_patterns')
    let g:neocomplete#sources#omni#input_patterns  =  {}
endif

let g:neocomplete#sources#omni#input_patterns.cs  =  '.*[^ = \);]'

autocmd FileType cs nnoremap gd :OmniSharpGotoDefinition<cr>
autocmd FileType cs nnoremap <leader>fi :OmniSharpFindImplementations<cr>
autocmd FileType cs nnoremap <leader>ft :OmniSharpFindType<cr>
autocmd FileType cs nnoremap <leader>fs :OmniSharpFindSymbol<cr>
autocmd FileType cs nnoremap <leader>fu :OmniSharpFindUsages<cr>
autocmd FileType cs nnoremap <leader>fm :OmniSharpFindMembers<cr>

autocmd FileType cs nnoremap <leader>x  :OmniSharpFixIssue<cr>
autocmd FileType cs nnoremap <leader>fx :OmniSharpFixUsings<cr>
autocmd FileType cs nnoremap <leader>tt :OmniSharpTypeLookup<cr>
autocmd FileType cs nnoremap <leader>d  :OmniSharpDocumentation<cr>

autocmd FileType cs nnoremap <C-K> :OmniSharpNavigateUp<cr>
autocmd FileType cs nnoremap <C-J> :OmniSharpNavigateDown<cr>

autocmd FileType cs nnoremap <leader>rn :OmniSharpRename<cr>
autocmd FileType cs nnoremap <leader>cf :OmniSharpCodeFormat<cr>
autocmd FileType cs nnoremap <leader>rl :OmniSharpReloadSolution<cr>

" lightline.vim
  let g:lightline = { 'colorscheme': 'wombat','component': {'readonly': '%{&readonly?"⭤":""}'}, 'mode_map': {'c': 'NORMAL'}, 'active': {'left': [['mode','paste'],['fugiitive','filename']]},'component_function':{'mode': 'LightLineMode' } }

  function! LightLineMode()
     return  &ft == 'unite' ? 'Unite' :
           \ &ft == 'vimfiler' ? 'VimFiler' :
           \ &ft == 'vimshell' ? 'VimShell' :
           \winwidth(0) > 60 ? lightline#mode() : ''
  endfunction
  
" Unite.vim
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

