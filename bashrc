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

# Alias related to vim
alias vi=vim

# Setting up PS1.
PS1='\u:\w$(__git_ps1 "\[\033[0;32m\]@\[\033[1;32m\]%s\[\033[0m\]\]") $ '

# Set the CC and CXX variables to clang, but allow a fallback shortcut, since
# some projects do not support clang yet (e.g. HHVM).
alias GCC='CC=/usr/bin/gcc CXX=/usr/bin/g++'

# Extraction for dummies
extract () {
    if [ -f $1 ]; then
        case $1 in
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
