# ~/.bash_profile

# Set CLICOLOR if you want Ansi Colors in iTerm2 
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

# Locale
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Aliases
alias ll='ls -alF'
alias la='ls -A'
alias ..='cd ..'

# Display git branch name
parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export -n PS1="\[\033[01;32m\]\u@\h\[\033[00m\]: \[\033[01;34m\]\w\[\033[01;33m\]\$(parse_git_branch)\[\033[00m\] $ "

# Activate current folder's pipenv virtualenv
# or accept an explicit virtualenv name
workon() {
    if [ $# -eq 0 ]
    then
        source "$(pipenv --venv)/bin/activate"
    else
        source "~/.virtualenvs/$1/bin/activate"
    fi
}

# Making virtualenv alias
mkvenv() {
    cd ~/.virtualenvs
    virtualenv "$@"
    cd -
    workon "$1"
}

# Automatic virtualenv sourcing
function auto_pipenv_shell {
    if [ ! -n "$VIRTUAL_ENV" ]; then
        if [ -f "Pipfile" ] ; then
            workon
        fi
    fi
}
function cd {
    builtin cd "$@"
    auto_pipenv_shell
}
auto_pipenv_shell
