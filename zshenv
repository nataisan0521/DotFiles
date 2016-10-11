# export PATH=$HOME/usr/bin:$PATH
export PATH=$HOME/.anyenv/bin:$PATH
eval "$(anyenv init -)"
psck () {
	ps -ef | grep "${1}" | grep -v grep;
}

