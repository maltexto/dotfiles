# .bashrc

# if not running interactively, don't do anything
[[ $- != *i* ]] && return

# update window size after every command
shopt -s checkwinsize

# automatically trim long paths in the prompt (requires Bash 4.x)
PROMPT_DIRTRIM=2

# enable history expansion with space
# E.g. typing !!<space> will replace the !! with your last command
bind Space:magic-space

# turn on recursive globbing (enables ** to recurse all directories)
shopt -s globstar 2> /dev/null

# smarter tab-completion (Readline bindings)

# perform file completion in a case insensitive fashion
bind "set completion-ignore-case on"

# treat hyphens and underscores as equivalent
bind "set completion-map-case on"

# display matches for ambiguous patterns at first tab press
bind "set show-all-if-ambiguous on"

# show all completions immediately if nothing has been typed
bind "set show-all-if-unmodified on"

# immediately add a trailing slash when autocompleting symlinks to directories
bind "set mark-symlinked-directories on"

# highlight the matching prefix in completions
bind "set colored-completion-prefix on"

# use colors to indicate file types in completions
bind "set colored-stats on"

# limit completion display width (-1 = use terminal width)
bind "set completion-display-width -1"

# history config

# append to the history file, don't overwrite it
shopt -s histappend

# save multi-line commands as one command
shopt -s cmdhist

# record each line as it gets issued
PROMPT_COMMAND='history -a'

# huge history. doesn't appear to slow things down, so why not?
HISTSIZE=500000
HISTFILESIZE=500000

# avoid duplicate entries
HISTCONTROL="erasedups:ignoreboth"

# don't record some commands
export HISTIGNORE="&:[ ]*:exit:ls:bg:fg:history:clear"

# use standard ISO 8601 timestamp
# %F equivalent to %Y-%m-%d
# %T equivalent to %H:%M:%S (24-hours format)
HISTTIMEFORMAT='%F %T '

# enable incremental history search with up/down arrows (also Readline goodness)
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'
bind '"\e[C": forward-char'
bind '"\e[D": backward-char'

# better cd nav
# prepend cd to directory names automatically
shopt -s autocd 2> /dev/null
# correct spelling errors during tab-completion
shopt -s dirspell 2> /dev/null
# correct spelling errors in arguments supplied to cd
shopt -s cdspell 2> /dev/null

# this defines where cd looks for targets
# add the directories you want to have fast access to, separated by colon
# ex: CDPATH=".:~:~/projects" will look for targets in the current working directory, in home and in the ~/projects folder
CDPATH=".:~:~/workspace"

# this allows you to bookmark your favorite places across the file system
# define a variable containing a path and you will be able to cd into it regardless of the directory you're in
# shopt -s cdable_vars

# ps1
# load git prompt (official git script)
source /usr/share/git/git-prompt.sh

# git prompt configuration
export GIT_PS1_SHOWDIRTYSTATE=1       # show * for dirty, + for staged
export GIT_PS1_SHOWSTASHSTATE=1       # show $ if stash exists
export GIT_PS1_SHOWUNTRACKEDFILES=1   # show % for untracked files
export GIT_PS1_SHOWUPSTREAM="auto"    # show upstream differences

function venvname {
  if [[ -n "$VIRTUAL_ENV" ]]; then
    echo "($(basename "$VIRTUAL_ENV")) "
  fi
}

MAGENTA='\[\033[35m\]'
GREEN='\[\033[0;32m\]'
WHITE='\[\033[1;37m\]'
YELLOW='\[\033[1;33m\]'
LIGHT_RED='\[\033[1;31m\]'
BLUE='\[\033[0;34m\]'
CYAN='\[\033[0;36m\]'
RESET='\[\033[0m\]'

PS1="\$(venvname)${MAGENTA}\u ${WHITE}at ${YELLOW}\h ${WHITE}in ${LIGHT_RED}\w${WHITE}\$(__git_ps1 \" on ${MAGENTA}%s${WHITE}\")${WHITE}\n\$ ${RESET}"

# xdg
# export XDG_RUNTIME_DIR="/run/user/$(id -u)"
# fix: dumb_runtime_dir
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$HOME/.cache"

# .local/bin
export PATH="$PATH:$HOME/.local/bin"

# DENO
[[ -s "$HOME/.deno/env" ]] && source "$HOME/.deno/env"
DENO_COMPLETION="$XDG_DATA_HOME/bash-completion/completions/deno.bash"
[[ -s $DENO_COMPLETION ]] && source $DENO_COMPLETION

# RUST
[[ -s "$HOME/.cargo/env" ]] && source "$HOME/.cargo/env"

# GO
export GOROOT="$HOME/.local/share/go"
export GOPATH="$HOME/.local/go"
export GOBIN="$HOME/.local/bin"
export PATH="$GOROOT/bin:$GOBIN:$PATH"

# JVM
[[ -d "$XDG_DATA_HOME/coursier/bin" ]] && export PATH="$PATH:$XDG_DATA_HOME/coursier/bin"
[[ -s "$HOME/.local/bin/setup_java.sh" ]] && source "$HOME/.local/bin/setup_java.sh"
setup_java
[[ -n "$JAVA_HOME" && -d "$JAVA_HOME/bin" ]] && export PATH="$PATH:$JAVA_HOME/bin"

# alias
[[ -s "$HOME/.bash_aliases" ]] && source "$HOME/.bash_aliases"

