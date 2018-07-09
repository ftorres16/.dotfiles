# ~/.bash_profile

[[ -s ~/.bashrc ]] && source ~/.bashrc


# Set CLICOLOR if you want Ansi Colors in iTerm2 
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

# Locale
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Aliases
alias ll='ls -ll'
alias ..='cd ..'

# Git official autocomplete
source /Users/fabian/Code/git/git-completion.bash

# Display git branch name
parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export -n PS1="\u@\h \[\033[32m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ "
