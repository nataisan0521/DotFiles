if [ -d $HOME/.anyenv ]
then
   export PATH="$HOME/.anyenv/bin:$PATH"
   eval "$(anyenv init -)"
fi
psck () {
	ps -ef | grep "${1}" | grep -v grep;
}

export GOPATH=$HOME
export PATH=$PATH:~/bin
