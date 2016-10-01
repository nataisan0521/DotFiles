
# Ensure that a non-login, non-interactive shell has a defined environment.
if [[ "$SHLVL" -eq 1 && ! -o LOGIN && -s "${ZDOTDIR:-$HOME}/.zprofile" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprofile"
fi

#export PATH="$HOME/.local/bin:$PATH"

if [ -d $HOME/.anyenv ] ; then
  export PATH="$HOME/.anyenv/bin:$PATH"
  eval "$(anyenv init -)"
  for D in 'ls $HOME/.anyenv/envs'
  do
    export PATH="$HOME/.anyenv/envs/$D/shims:$PATH"
  done
fi

psck () { 
	ps -ef | grep "${1}" | grep -v grep; 
}
