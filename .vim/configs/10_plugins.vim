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

                                                                                        "
