# .bashrc

# if not running interactively, don't do anything
[[ $- != *i* ]] && return

# don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth

HISTSIZE=1000
HISTFILESIZE=2000

# append to the history file, don't overwrite it
shopt -s histappend

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# ==GIT==
function parse_git_dirty {
  [[ $(git status 2> /dev/null | tail -n1 | cut -c 1-17) != "nothing to commit" ]] && echo "*"
}

function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/\1$(parse_git_dirty)/"
}

# ==VENV==
function venvname {
  if [[ -n "$VIRTUAL_ENV" ]]; then
    echo "($(basename "$VIRTUAL_ENV")) "
  fi
}

# ==PS1==
MAGENTA='\[\033[35m\]'
GREEN='\[\033[0;32m\]'
WHITE='\[\033[1;37m\]'
YELLOW='\[\033[1;33m\]'
LIGHT_RED='\[\033[1;31m\]'
BLUE='\[\033[0;34m\]'
CYAN='\[\033[0;36m\]'
RESET='\[\033[0m\]'

PS1="$(venvname) ${MAGENTA}\u ${WHITE}at ${YELLOW}\h ${WHITE}in ${LIGHT_RED}\w${WHITE}\$([[ -n \$(git branch 2> /dev/null) ]] && echo \" on \")${PURPLE}\$(parse_git_branch)${WHITE}\n\$ ${RESET}"

# ==XDG==
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$HOME/.cache"

# ==.LOCAL/BIN==
export PATH="$PATH:$HOME/.local/bin"

# ==DENO==
[[ -s "$HOME/.deno/env" ]] && source "$HOME/.deno/env"

# ==VOLTA==
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

# 🦀
[[ -s "$HOME/.cargo/env" ]] && source "$HOME/.cargo/env"

# ==GHCUP==
[[ -s "$HOME/.ghcup/env" ]] && source "$HOME/.ghcup/env"

# ah shit, here we go again
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# ==ALIAS==
[[ -s "$HOME/.alias" ]] && source "$HOME/.alias"
