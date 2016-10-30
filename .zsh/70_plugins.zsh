source $ZPLUG_HOME/init.zsh

zplug "mollifier/anyframe"
zplug "mollifier/cd-gitroot"
zplug "b4b4r07/enhancd", of:enhancd.sh
zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-syntax-highlighting", nice:10
zplug "zsh-users/zsh-completions"
zplug "junegunn/fzf-bin", as:command, from:gh-r, file:fzf
zplug "junegunn/fzf", as:command, of:bin/fzf-tmux
zplug "peco/peco", as:command, from:gh-r, of:"*amd64*"
zplug "b4b4r07/dotfiles", as:command, of:bin/peco-tmux
zplug "b4b4r07/dotfiles", as:command, of:bin/git-get

peco-src(){
    local selected
    selected="$(ghq list --full-path | peco --query="$LBUFFER")"
    if [ -n "$selected" ]; then
        BUFFER="cd $selected"
        # zle accept-line
    fi
    zle reset-pronpt
}

zle -N peco-src
bindkey '^]' peco-src
