
export EDITOR='vim'

colortest () {
    for i in {0..255} ; do
        printf "\x1b[48;5;%sm%3d\e[0m " "$i" "$i"
        if (( i == 15 )) || (( i > 15 )) && (( (i-15) % 6 == 0 )); then
            printf "\n";
        fi
    done
}

# If not running interactively, don't do anything
# https://unix.stackexchange.com/questions/257571/why-does-bashrc-check-whether-the-current-shell-is-interactive
[[ $- != *i* ]] && return


# Different prompt when working through ssh 
if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
    PS1="\[\033[01;31m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\W\[\033[00m\]\$ "
else
    PS1=" \[\033[01;34m\]\W \[\033[00m\]\$ "
fi

# git bare
alias mycfg='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# places
PLACES_LIST="$HOME/.myscripts/places.list"
PLACES_MENU="fzf"
#PLACES_MENU="rofi"
#PLACES_MENU="dmenu -i -l 30 -p Places"
source "$HOME/.myscripts/places.sh"
alias pl="places"

# grep
alias grep='grep --color=auto'
alias egrep='grep -E'

# ls
alias ls='ls --color=auto -CFh'
alias ll='ls -al'
alias la='ls -a'

# Confirm when deleting/overwriting
alias mv='mv -i'
alias cp='cp -i'
alias rm='rm -i'

# git
alias ga='git add'
alias gc='git commit -m'
alias gp='git push'
alias gs='git status'
alias gd='git diff'
alias gl='git log'

# Echo dirs by size
alias dirsize='du -sh * | sort -h'

# Colors in gcc errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

set -o vi # vi mode
shopt -s autocd # change to named directory
shopt -s cdspell # autocorrects cd misspellings
shopt -s cmdhist # save multi-line commands in history as single line
shopt -s dotglob
shopt -s histappend # do not overwrite history
shopt -s expand_aliases # expand aliases
shopt -s checkwinsize # checks term size when bash regains control

# History
HISTCONTROL=ignoreboth
HISTSIZE=1000
HISTFILESIZE=2000

