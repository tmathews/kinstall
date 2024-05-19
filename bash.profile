export PATH="$HOME/bin:$HOME/scripts"
export EDITOR=nvim
export HISTCONTROL=ignoreboth:erasedups
export PS1="[\[\e[32m\]\W\[\e[0m\]] "
export MOZ_ENABLE_WAYLAND=1
export XDG_CACHE_HOME=$HOME/.cache

alias hist="cat ~/.bash_history | sort | uniq - | fzf"
alias dir="ls -alh --color --group-directories-first"
alias calc="bc --quiet"
