# Set LC_ALL always to UTF-8
export LC_ALL=en_US.UTF-8

# Set vim as the default editor
export EDITOR=vim
export VISUAL=vim

# Set the LESS and the PAGER environment variables.
export LESS="FSRX"
export PAGER=less

# Export the clang paths
export CC=/usr/bin/clang
export CXX=/usr/bin/clang++

# Go things
export GOPATH=$HOME/Projects/go/
export PATH=$GOROOT/bin:$PATH:${GOPATH}bin

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM
into a shell session *as a function*
