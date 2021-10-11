if [ -z "$WT_SESSION" ]; then
    alias vim="winpty nvim"
else
    alias vim="export TERM=xterm-256color; nvim"
fi

alias vi="vim"
