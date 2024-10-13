# .bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

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

# ==XDG==
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$HOME/.cache"

# ==.LOCAL/BIN==
export PATH="$PATH:$HOME/.local/bin"

# ==DENO==
export DENO_INSTALL="$HOME/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"

# ==VOLTA==
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

# ==RUSTUP==
[ -f "$HOME/.cargo/env" ] && source "$HOME/.cargo/env"

# ==GHCUP==
[ -f "$HOME/.ghcup/env" ] && source "$HOME/.ghcup/env"

# ==SDKMAN==
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# ==ALIAS==
[ -f "$HOME/.alias" ] && source "$HOME/.alias"
. "/home/maltexto/.deno/env"