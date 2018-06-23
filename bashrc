# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions
PS1="\[\033[35m\]\t\[\033[m\]-\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$(parse_git_branch)\[\033[00m\] $ "
PS1="\n\[\033[35m\]\$(/bin/date) \[\033[1;34m\]\$(/usr/bin/tty | /bin/sed -e 's:/dev/::'): \[\033[1;36m\]\$(/bin/ls -1 | /usr/bin/wc -l | /bin/sed 's: ::g') files \[\033[1;33m\]\$(/bin/ls -lah | /bin/grep -m 1 total | /bin/sed 's/total //')b\[\033[0m\]: \[\033[32m\]\w\n\[\033[1;31m\]\u@\h: \[\033[0m\]"

shopt -s nocaseglob 
shopt -s cdspell 
shopt -s histappend

export HISTCONTROL=ignoreboth
export INPUTRC=$HOME/.inputrc
export HISTSIZE=5000
export HISTFILESIZE=5000

alias ls='ls -ltr'
alias bk='cp -p $1 $1."gree"'
#alias bk='cp -p $1 $1.$(date +%y%m%d%H%M%S)'

parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

rbk() 
{
if (( $# < 1 )); then
      echo "Usage: bk filename(s)"
        exit 1
        fi

        for i in "$@"; do

              echo "backing up..."$i
              cp -p $i $i.$(date +%y%m%d%H%M%S)

              done

}
alias bk=rbk
