# alias

alias cat="bat"
alias vim="nvim"
alias ls="lsd --almost-all"
alias la="lsd --all --long"
alias ll="lsd --long"
alias tree="lsd --tree"

alias cp="cp -i"                # confirm before overwriting
alias mv="mv -i"                # confirm before overwriting
alias rm="rm -i"                # confirm before removing
alias mkdir="mkdir -p"          # create parent directories

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias ~="cd ~"

alias g="git"
alias gs="git status"
alias ga="git add"
alias gc="git commit"
alias gp="git push"
alias gl="git pull"
alias gd="git diff"
alias gb="git branch"
alias gs="git switch"
alias glog="git log --oneline --graph --decorate --all"

alias df="df -h"                # human readable disk usage
alias du="du -h"                # human readable directory sizes
alias free="free -h"            # human readable memory usage
alias ps="ps aux"               # detailed process list

alias ping="ping -c 5"          # limit ping to 5 packets
alias ports="netstat -tulanp"   # show open ports

# package management (void linux)
alias xi="sudo xbps-install"
alias xu="sudo xbps-install -Su"
alias xr="sudo xbps-remove -Oo"
alias xq="xbps-query"

# screenshots and media
alias ss="shotgun -g \"\$(slop -f \"%g\")\""
alias iv="nsxiv"

alias ocaml="rlwrap ocaml"
alias gi="gem install --env-shebang"

# quick edits
alias bashrc="nvim ~/.bashrc"
alias aliases="nvim ~/.bash_aliases"
alias nvimrc="nvim ~/.config/nvim/init.lua"

# cargo shortcuts (rust)
alias cb="cargo build"
alias cr="cargo run"
alias ct="cargo test"
alias cc="cargo check"
alias cf="cargo fmt"
alias ccl="cargo clippy"

# go shortcuts
alias gor="go run"
alias gob="go build"
alias got="go test"
alias gof="go fmt"
alias gom="go mod"
