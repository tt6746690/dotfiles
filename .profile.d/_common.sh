# aliases
alias la='ls -a'
alias ll='ls -la'
alias cdd='cd ..'
alias cddd='cd ...'
alias rmswp='find ./ -maxdepth 1 -type f -name "\.*sw[klmnop]" -delete'
alias python='python3'

# tmux
export DISABLE_AUTO_TITLE=true
alias t='tmux a -t base || tmux new -s base'
