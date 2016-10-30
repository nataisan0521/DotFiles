
set guifont=Ricty\ Regular\ 12
set cmdheight=2  "コマンドラインの高さ(GUI使用時)
"メニュー関係
set winaltkeys=no "Alt+xでメニューをフォーカスしない
" Alt+Spaceでウィンドウのシステムメニュー
nnoremap <silent> <M-Space> :<C-u>simalt ~<CR>

"タブ関係
set guitablabel=%M\ %-20.20t

"マウス関係
set mouse=a
" マウスの移動でフォーカスを自動的に切替えない (mousefocus:切替る)
set nomousefocus
" 入力時にマウスポインタを隠す (nomousehide:隠さない)
set mousehide

"IME関係
if has('multi_byte_ime') || has('xim')
  " 挿入モード・検索モードでのデフォルトのIME状態設定
  set iminsert=0 imsearch=0
  if has('xim') && has('GUI_GTK')
"    set imactivatekey=C-space
    set imactivatekey=Zenkaku_Hankaku
  endif
  " 挿入モードでのIME状態を記憶させない
  inoremap <silent> <ESC> <ESC>:set iminsert=0<CR>
endif

"クリップボード関係
inoremap <S-Insert> <C-R><C-O>+
nnoremap <S-Insert> "+P
vnoremap <S-Insert> "+p
vnoremap <C-Insert> "+y
vnoremap <S-Delete> "+x

source ~/.vimrc
