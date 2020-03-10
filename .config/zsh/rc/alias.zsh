# -*- sh -*-

# rot13
alias rot13="tr 'A-Za-z' 'N-ZA-Mn-za-m'"
# ls
alias llrt="ls -lrta"

# xbps
alias xq="xbps-query -Rs"
alias xi="sudo xbps-install -S"
alias xu="sudo xbps-install -Su"

alias x=extract

alias config="git --git-dir=$HOME/WORK/jp/git/dotfiles/ --work-tree=$HOME"
alias e="qemacs"
alias xclip="xclip -selection clipboard"
alias monip="curl ipv4.icanhazip.com"
alias monip6="curl ipv6.icanhazip.com"
alias pass="PASSWORD_STORE_DIR=~/WORK/jp/git/password-store/ pass"
alias grep='grep --color=auto'
alias sudo='sudo '
alias notif='python ~/WORK/jp/pyrnotify.py 4321 & ssh -f -N -q -R 4321:localhost:4321 numenor'

alias docker='sudo docker'
alias rm_docker='docker ps -a | awk '\''{print $1}'\'' | grep -v CONTAINER | xargs docker rm'
alias vlc='vlc --avcodec-hw=vaapi'
alias cpu_perf='echo performance | sudo tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor'

# tmux
alias ta='tmux attach -t'
alias tad='tmux attach -d -t'
alias ts='tmux new-session -s'
alias tl='tmux list-sessions'
alias tksv='tmux kill-server'
alias tkss='tmux kill-session -t'

# pipenv
alias pch="pipenv check"
alias pcl="pipenv clean"
alias pgr="pipenv graph"
alias pi="pipenv install"
alias pidev="pipenv install --dev"
alias pl="pipenv lock"
alias po="pipenv open"
alias prun="pipenv run"
alias psh="pipenv shell"
alias psy="pipenv sync"
alias pu="pipenv uninstall"
alias pwh="pipenv --where"
alias pvenv="pipenv --venv"
alias ppy="pipenv --py"
