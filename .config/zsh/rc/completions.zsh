# -*- sh -*-

##
# Completion
##

autoload -Uz compinit
if [[ -n ${ZDOTDIR:-$HOME}/.zcompdump(N.mh+2) ]]; then
    compinit
else
    compinit -C
fi

# completion caching, use rehash to clear
zstyle ':completion::complete:*' use-cache on
# cache path
zstyle ':completion:*' cache-path ~/.config/zsh/cache
# case insensitive (all), partial-word and substring completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'
# menu if nb items > 2
zstyle ':completion:*' menu select=2
# colorz !
zstyle ':completion:*' list-colors "${(@s.:.)LS_COLORS}"
# list of completers to use
zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate

# sections completion !
zstyle ':completion:*' verbose yes
zstyle ':completion:*:descriptions' format $'\e[00;34m%d'
zstyle ':completion:*:messages' format $'\e[00;31m%d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*:manuals' separate-sections true

zstyle ':completion:*:complete:cd:*' tag-order local-directories named-directories path-directories

zstyle ':completion:*:processes' command 'ps -au$USER'
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:kill:*' force-list always
zstyle ':completion:*:*:kill:*:processes' list-colors "=(#b) #([0-9]#)*=29=34"
zstyle ':completion:*:*:killall:*' menu yes select
zstyle ':completion:*:killall:*' force-list always

# because I don't care about others
users=(jenfi root)
zstyle ':completion:*' users $users

_ssh_config_hosts=(${(s: :)${(ps:\t:)${(f)"$(<$HOME/.ssh/config|grep '^Host')"}#Host}#Hostname})

custom_hosts=(
    "$_ssh_config_hosts[@]"
    localhost
)

#zstyle ':completion:*:hosts' hosts $custom_hosts
zstyle ':completion:*:(ssh|scp|sftp):*' hosts $custom_hosts

# Don't use known_hosts_file (too slow)
zstyle ":completion:*:hosts" known-hosts-files ''
