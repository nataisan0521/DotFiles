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

syntax enable
set laststatus=2
set t_co=256
let g:solarized_termtrans=1
let g:solarized_contrast="high"
set background=dark
colorscheme solarized 

" lightline.vim
  let g:lightline = { 'colorscheme': 'solarized','component': {'readonly': '%{&readonly?"⭤":""}'}, 'mode_map': {'c': 'NORMAL'}, 'active': {'left': [['mode','paste'],['fugiitive','filename']]},'component_function':{'mode': 'LightLineMode' } }

  function! LightLineMode()
     return  &ft == 'unite' ? 'Unite' :
           \ &ft == 'vimfiler' ? 'VimFiler' :
           \ &ft == 'vimshell' ? 'VimShell' :
           \winwidth(0) > 60 ? lightline#mode() : ''
  endfunction
 
