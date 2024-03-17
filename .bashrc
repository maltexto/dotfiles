# .bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

#set XDG_RUNTIME_DIR
#export XDG_RUNTIME_DIR='/run/user/$(id -u)'

# Add .local/bin to path
export PATH="$PATH:$HOME/.local/bin"

source $HOME/.alias

# ==GIT==
function parse_git_dirty {
  [[ $(git status 2> /dev/null | tail -n1 | cut -c 1-17) != "nothing to commit" ]] && echo "*"
}

function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/\1$(parse_git_dirty)/"
}

# ==ṔS1==
MAGENTA='\033[35m'
PURPLE='\e[0;35m'
GREEN='\e[0;32m'
WHITE='\e[1;37m'
YELLOW='\e[1;33m'
LIGHT_RED='\e[1;31m'
BLUE='\e[0;34m'
CYAN='\e[0;36m'
RESET='\[\e[0m\]'

PS1="${MAGENTA}\u ${WHITE}at ${YELLOW}\h ${WHITE}in ${LIGHT_RED}\w${WHITE}\$([[ -n \$(git branch 2> /dev/null) ]] && echo \" on \")${PURPLE}\$(parse_git_branch)${WHITE}\n\$ ${RESET}"

# ==SDKMAN==
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# ==OPAM==
test -r $HOME/.opam/opam-init/init.sh && source $HOME/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true

# ==VOLTA==
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

# ==GO==
export PATH=$PATH:$HOME/.local/go/bin
export GOBIN=$HOME/.local/bin/gobin
export GOMODCACHE=$HOME/.local/bin/gomodcache
export PATH=$PATH:$GOBIN

# ==LISP==
export SBCL_HOME="$HOME/.local/sbcl"
export PATH="$SBCL_HOME/bin:$PATH"

# ==DENO==
export DENO_INSTALL="$HOME/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"

# ==RUSTUP==
source "$HOME/.cargo/env"

# ==chruby==
source /usr/local/share/chruby/chruby.sh
source /usr/local/share/chruby/auto.sh

# ==GHCUP==
[ -f "$HOME/.ghcup/env" ] && source "$HOME/.ghcup/env"
