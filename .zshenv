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
export GOPATH=$HOME

export PERCOL=$HOME/bin/peco

export ZPLUG_HOME=$HOME/.zplug

export PATH="$HOME/.anyenv/bin:$PATH"
eval "$(anyenv init -)"
for D in `ls $HOME/.anyenv/envs`
do
    export PATH="$HOME/.anyenv/envs/$D/shims:$PATH"
done

eval "$(pyenv virtualenv-init -)"

# export PATH="$HOME/.local/bin:$PATH"
