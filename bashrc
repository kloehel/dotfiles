
# Set LC_ALL always to UTF-8
export LC_ALL=en_US.UTF-8

# beautifying ls command
alias ls='ls --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias ll='ls -lh --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias la='ls -lah --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'

# Alias related to cp/mv/mkdir
alias cp='cp -i'
alias mv='mv -i'

# Alias related to find
alias ff='find ~/ -name $1'

# Alias related to cd
alias ..='cd ..'
alias cd..='cd ..'

# Set vim as the default editor
export EDITOR=vim
export VISUAL=vim
alias vi=vim

# We want a full-fledged 256-color terminal.
TERM=xterm-256color

# Set the LESS and the PAGER environment variables.
export LESS="FSRX"
export PAGER=less

# Sources the given file if it really exists.
source_maybe() {
    if [ -f $1 ]; then
        source $1
    fi
}

# git thingies.
source_maybe $HOME/.gitcompletion.sh
alias gti=git

# Setting up PS1.
PS1='\u:\w$(__hg_branch)$(__git_ps1 "\[\033[0;32m\]@\[\033[1;32m\]%s\[\033[0m\]\]") $ '

# Rake completion
if [ -f $HOME/.rake_completion ]; then
    complete -C $HOME/.rake_completion -o default rake
fi

# Export the CMake paths so it searches for KDE in the right places
export CMAKE_PREFIX_PATH=$KDEDIR:$CMAKE_PREFIX_PATH
export CMAKE_LIBRARY_PATH=$KDEDIR/lib:$CMAKE_LIBRARY_PATH
export CMAKE_INCLUDE_PATH=$KDEDIR/include:$CMAKE_INCLUDE_PATH

# Alias bundle exec
alias be='bundle exec'

# Set the CC and CXX variables to clang, but allow a fallback shortcut, since
# some projects do not support clang yet (e.g. HHVM).
alias GCC='CC=/usr/bin/gcc CXX=/usr/bin/g++'
export CC=/usr/bin/clang
export CXX=/usr/bin/clang++

# Go things
export GOROOT_BOOTSTRAP=/opt/go1.4
export GOROOT=$HOME/Projects/go
export GOPATH=$HOME/Projects/golang
export PATH=$GOROOT/bin:$PATH:$GOPATH/bin

# The Review utility. See: https://github.com/mssola/review
export PATH=/opt/review:$PATH
source_maybe $HOME/.review_completion.sh

# Complete the `docker` command if possible.
source_maybe $HOME/.dockercompletion.sh

# Add the `scripts` dir to the path if possible. See:
# https://github.com/jloehel/scripts.
if [ -d $HOME/.scripts ]; then
    export PATH=$HOME/.scripts:$PATH
fi

# Finally get RVM straight.
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
export PATH="$PATH:$HOME/.rvm/bin"

# Extraction for dummies
extract () {
    if [ -f $1 ]; then
        case $1 in)
            *.tar.gz)   tar xvzf $1     ;;
            *.tar.bz2)  tar xvjf $1     ;;
            *.rar)      rar x $1        ;;
            *.bz2)      bunzip2 -d $1   ;;
            *.zip)      unzip $1        ;;
            *.7z)       7z x $1         ;;
            *)          echo "Ist jetzt Katze! o.O"
        esac
    else
        echo "File: '$1', not found."
    fi
}

mktar() { tar cvf   "${1%%/}.tar"     "${1%%/}/"; }
mktgz() { tar cvzf  "${1%%/}.tar.gz"  "${1%%/}/"; }
mktar() { tar cvjf  "${1%%/}.tar.bz2" "${1%%/}/"; }
