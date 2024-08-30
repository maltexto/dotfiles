# .bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# set XDG_RUNTIME_DIR
# export XDG_RUNTIME_DIR='/run/user/$(id -u)'

# ==GIT==
function parse_git_dirty {
  [[ $(git status 2> /dev/null | tail -n1 | cut -c 1-17) != "nothing to commit" ]] && echo "*"
}

function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/\1$(parse_git_dirty)/"
}

# ==PS1==
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

# ==.LOCAL/BIN==
export PATH="$PATH:$HOME/.local/bin"

# ==COURSIER==
export PATH="$PATH:$HOME/.local/share/coursier/bin"

# ==DENO==
export DENO_INSTALL="$HOME/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"

# ==VOLTA==
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

# ==GO==
export PATH=$PATH:$HOME/.local/go/bin
export GOBIN=$HOME/.local/bin/gobin
export GOMODCACHE=$HOME/.local/bin/gomodcache
export PATH=$PATH:$GOBIN

# ==RUSTUP==
[ -f "$HOME/.cargo/env"] && source "$HOME/.cargo/env"

# ==GHCUP==
[ -f "$HOME/.ghcup/env"] && source "$HOME/.ghcup/env"

# ==ALIAS==
[ -f "$HOME/.alias"] && source $HOME/.alias




# ==JAVA==
export JAVA_HOME="$HOME/.cache/coursier/arc/https/github.com/adoptium/temurin17-binaries/releases/download/jdk-17%252B35/OpenJDK17-jdk_x64_linux_hotspot_17_35.tar.gz/jdk-17+35"
export CS_FORMER_JAVA_HOME="$JAVA_HOME"
export PATH="$JAVA_HOME/bin:$PATH"
