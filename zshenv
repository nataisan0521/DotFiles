export PATH=$HOME/.anyenv/bin:$PATH
export PATH=$HOME/usr/bin:$PATH
eval "$(anyenv init -)"

psck () {
	ps -ef | grep "${1}" | grep -v grep;
}
