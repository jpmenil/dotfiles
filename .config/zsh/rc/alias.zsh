# -*- sh -*-

# git
alias ga='git add'
alias gcb='git checkout -b'
alias gcm='git checkout $(git_main_branch)'
alias gmsg='git commit -m'
alias gsmsg='git commit -s -m'
alias gco='git checkout'
alias gl='git pull'
alias gp='git push'
alias grv='git remote -v'
alias gst='git status'
alias gg='git grep'
alias glf='git log --follow -p --'
alias ad='arc diff'
alias af='arc feature'

# ls
alias ll="ls -la --color=auto"
alias llrt="ls -lrta --color=auto"

# xbps
alias xq="xbps-query -Rs"
alias xi="sudo xbps-install -S"
alias xo="sudo xbps-remove -Oo"
alias xu="sudo xbps-install -Su"

# tmux
alias ta='tmux attach -t'
alias tad='tmux attach -d -t'
alias ts='tmux new-session -s'
alias tl='tmux list-sessions'
alias tksv='tmux kill-server'
alias tkss='tmux kill-session -t'

# stuff
alias abook="abook -C ~/.config/abook/abookrc --datafile ~/.config/abook/addressbook"
alias cdqmk='cd ~/WORK/jp/git/qmk_firmware/'
alias config="git --git-dir=$HOME/WORK/jp/git/dotfiles/ --work-tree=$HOME"
alias cpu_perf='echo performance | sudo tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor'
alias docker='sudo docker'
alias e="emacsclient -nw -a="
alias ek='ps aux | grep "[e]macs --daemon" | awk '\''{print $2}'\'' | xargs kill -9'
alias grep='grep --color=auto'
alias monip="curl ipv4.icanhazip.com"
alias monip6="curl ipv6.icanhazip.com"
alias notmuch="notmuch --config ~/.config/notmuch-config"
alias pass_perso="PASSWORD_STORE_DIR=~/WORK/jp/git/password-store/ pass"
alias rm_docker='docker ps -a | awk '\''{print $1}'\'' | grep -v CONTAINER | xargs docker rm'
alias rot13="tr 'A-Za-z' 'N-ZA-Mn-za-m'"
alias x=extract
