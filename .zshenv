if [[ -z "$LANG" ]]; then
  export LANG='ja_JP.UTF-8'
fi

export KCODE=u           # KCODEにUTF-8を設定
export AUTOFEATURE=true  # autotestでfeatureを動かす

# Editor
export EDITOR=vim
export CVSEDITOR="${EDITOR}"
export SVN_EDITOR="${EDITOR}"
export GIT_EDITOR="${EDITOR}"

export PATH="$HOME/bin:$PATH"
eval "$(anyenv init -)"
export GOPATH=$HOME

export PERCOL=$HOME/bin/peco

export ZPLUG_HOME=$HOME/src/github.com/zplug/zplug
export TERM = xterm-256color
