# -*- sh -*-

##
# Completion
##

#zstyle ':completion:*' list-colors "${(@s.:.)LS_COLORS}"
#autoload -Uz compinit
#compinit
#zmodload -i zsh/complist

# completion caching, use rehash to clear
zstyle ':completion::complete:*' use-cache on
# cache path
zstyle ':completion:*' cache-path ~/.config/zsh/cache
# case insensitive (all), partial-word and substring completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'
# menu if nb items > 2
zstyle ':completion:*' menu select=2
# colorz !
#zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
#export LS_COLORS="d=i1;;40:ln=35;40:so=32;40:pi=33;40:ex=31;40:bd=34;46:cd=34;43:su=0;41:sg=0;46:tw=0;42:ow=0;43:"
#export LS_COLORS="di=37;40:ln=35;40:so=32:pi=33:ex=31:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43"
#export LS_COLORS="di=32;40"
export LS_COLORS="di=10;36:ln=1;31:so=37:pi=1;35:ex=37:bd=37:cd=37:su=37:sg=37:tw=1;36:ow=1;36"
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

autoload -Uz compinit
compinit
zmodload -i zsh/complist
