source $ZPLUG_HOME/init.zsh

zplug "mollifier/anyframe"
zplug "mollifier/cd-gitroot"
zplug "b4b4r07/enhancd", use:enhancd.sh
zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-syntax-highlighting", nice:10
zplug "zsh-users/zsh-completions"
zplug "junegunn/fzf-bin", as:command, from:gh-r, rename-to:fzf
zplug "junegunn/fzf", as:command, use:bin/fzf-tmux
zplug "peco/peco", as:command, from:gh-r, use:"*linux_amd64*"
zplug "b4b4r07/dotfiles", as:command, use:bin/peco-tmux
zplug "b4b4r07/dotfiles", as:command, use:bin/git-get

# check コマンドで未インストール項目があるかどうか verbose にチェックし
# false のとき(つまり未インストール項目がある)y/N プロンプトで
# インストールする
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# プラグインを読み込み、コマンドにパスを通す
zplug load --verbose

peco-src(){
    local selected
    selected="$(ghq list --full-path | peco --query="$LBUFFER")"
    if [ -n "$selected" ]; then
        BUFFER="cd $selected"
        # zle accept-line
    fi
    zle reset-prompt
}

zle -N peco-src
bindkey '^]' peco-src
