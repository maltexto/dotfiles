# .bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

#set XDG_RUNTIME_DIR
#export XDG_RUNTIME_DIR='/run/user/$(id -u)'

# Add .local/bin to path
export PATH="$PATH:/home/$USER/.local/bin"

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

# ==GNU Screen==
handle_screen_session() {
    session_name=$1
    if [ -z "$session_name" ]; then
        read -p "screen session name: " session_name
    fi
    session_id=$(screen -ls | awk -v name="$session_name" '$1 ~ /^[0-9]{4}\.'"$session_name"'$/ {print $1; exit}')
    if [ -n "$session_id" ]; then
        screen -r "$session_id"
    else
        screen -S "$session_name"
    fi
}

# ==SDKMAN==
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# ==OPAM==
test -r $HOME/.opam/opam-init/init.sh && . $HOME/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true

# ==NVM==
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"


# ==GO==
export PATH=$PATH:$HOME/.local/go/bin 
export GOPATH=$HOME/workspace/go
export PATH=$PATH:$GOPATH/bin

# ==LISP==
export SBCL_HOME=$HOME/.local/sbcl

# ==DENO==
export DENO_INSTALL="$HOME/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"

# ==ALIAS==
alias ls="ls --color=auto"
alias vm="VBoxManage"
alias ss="handle_screen_session"
alias lss="screen -ls"
alias ocaml="rlwrap ocaml"
