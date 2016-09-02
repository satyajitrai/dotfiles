export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

export EDITOR=vim
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
export PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/~}"; echo -ne "\007"'
export JAVA_HOME=$(/usr/libexec/java_home)

# for rust
export DYLD_LIBRARY_PATH=/usr/local/lib

# See http://geekology.co.za/article/2009/04/how-to-enable-terminals-directory-and-file-color-highlighting-in-mac-os-x
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagacad

# For history control - see http://blog.macromates.com/2008/working-with-history-in-bash/
export HISTCONTROL=erasedups
export HISTSIZE=10000
shopt -s histappend
alias ls="ls -G"
alias rm="rm -i"
alias mv="mv -i"
alias cp="cp -i"
# We can use SOCKSv4 proxy at port 9999
alias tunnel='ssh -C -L 9999:socks.yahoo.com:1080 srai@proxy.eglbp.corp.yahoo.com'

function term_title { printf "\033]0;%s\007" "$1"; }

source ~/.git-prompt.sh
PS1="\h:\W \u\$(__git_ps1)\$ "

# Add bash completion for ssh: it tries to complete the host to which you 
# want to connect from the list of the ones contained in ~/.ssh/known_hosts

__ssh_known_hosts() {
    if [[ -f ~/.ssh/known_hosts ]]; then
        cut -d " " -f1 ~/.ssh/known_hosts | cut -d "," -f1
    fi
}

_ssh() {
    local cur known_hosts
    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"
    known_hosts="$(__ssh_known_hosts)"
    
    if [[ ! ${cur} == -* ]] ; then
    	COMPREPLY=( $(compgen -W "${known_hosts}" -- ${cur}) )
        return 0
    fi
}

complete -o bashdefault -o default -o nospace -F _ssh ssh 2>/dev/null \
	|| complete -o default -o nospace -F _ssh ssh
complete -o bashdefault -o default -o nospace -F _ssh scp 2>/dev/null \
	|| complete -o default -o nospace -F _ssh scp

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"
