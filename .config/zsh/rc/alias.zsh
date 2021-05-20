# -*- sh -*-

# git
alias ga='git add'
alias gcb='git checkout -b'
alias gcm='git checkout $(git_main_branch)'
alias gcmsg='git commit -s -m'
alias gco='git checkout'
alias gl='git pull'
alias gp='git push'
alias grv='git remote -v'
alias gst='git status'

# ls
alias ll="ls -la --color=auto"
alias llrt="ls -lrta --color=auto"

# tmux
alias ta='tmux attach -t'
alias tad='tmux attach -d -t'
alias ts='tmux new-session -s'
alias tl='tmux list-sessions'
alias tksv='tmux kill-server'
alias tkss='tmux kill-session -t'

# xbps
alias xq="xbps-query -Rs"
alias xi="sudo xbps-install -S"
alias xo="sudo xbps-remove -Oo"
alias xu="sudo xbps-install -Su"

# stuff
alias abook="abook -C ~/.config/abook/abookrc --datafile ~/.config/abook/addressbook"
alias config="git --git-dir=$HOME/WORK/jp/git/dotfiles/ --work-tree=$HOME"
alias cpu_perf='echo performance | sudo tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor'
alias docker='sudo docker'
alias e="qemacs -nw --free-all"
alias grep='grep --color=auto'
alias mbsync='mbsync -c ~/.config/mbsyncrc'
alias monip="curl ipv4.icanhazip.com"
alias monip6="curl ipv6.icanhazip.com"
alias notif='python ~/bin/pyrnotify.py 4321 & ssh -f -N -q -R 4321:localhost:4321 numenor'
alias notmuch="notmuch --config ~/.config/notmuch-config"
alias pass="PASSWORD_STORE_DIR=~/WORK/jp/git/password-store/ pass"
alias rm_docker='docker ps -a | awk '\''{print $1}'\'' | grep -v CONTAINER | xargs docker rm'
alias rot13="tr 'A-Za-z' 'N-ZA-Mn-za-m'"
alias x=extract
alias vlc='vlc --avcodec-hw=vaapi'
alias xclip="xclip -selection clipboard"
alias weechat="weechat -d ~/.config/weechat"

# pulumi
alias pls='pulumi stack ls'
