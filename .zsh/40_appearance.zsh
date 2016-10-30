### Ls Color ###
# 色の設定
export LSCOLORS=Exfxcxdxbxegedabagacad
# 補完時の色の設定
export LS_COLORS='di=01;34:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
# ZLS_COLORSとは？
export ZLS_COLORS=$LS_COLORS
# lsコマンド時、自動で色がつく(ls -Gのようなもの？)
export CLICOLOR=true
# 補完候補に色を付ける
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}


### Prompt ###
# プロンプトに色を付ける
autoload -U colors; colors
autoload -Uz vcs_info  
setopt prompt_subst
# 一般ユーザ時
zstyle ':vcs_info:*' formats '%s][* %F{green}%b%f'
zstyle ':vcs_info:*' actionformats '%s][* %F{green}%b%f(%F{red}%a%f)'
precmd() { vcs_info }

PROMPT='[%n@%m]%#' # 通常のプロンプト
PROMPT2='%{${fg[cyan]}%}%_> %{${reset_color}%}'  # セカンダリのプロンプト(コマンドが2行以上の時に表示される)
RPROMPT='[${vcs_info_msg_0_}]%{${fg[green]}%}[%c]%{${reset_color}%}'  # 右側のプロンプト
SPROMPT='%{${fg[yellow]}%}%r is correct? [Yes, No, Abort, Edit]:%{${reset_color}%}'  # スペル訂正用プロンプト
# SSHログイン時のプロンプト
[ -n "${REMOTEHOST}${SSH_CONNECTION}" ] &&
  PROMPT="%{${fg[white]}%}${HOST%%.*} ${PROMPT}"
;


