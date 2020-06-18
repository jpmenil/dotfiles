# -*- sh -*-

ZSH=${ZSH:-${ZDOTDIR:-$HOME}/.config/zsh}

() {
    for config_file ($ZSH/rc/*.zsh) source $config_file
}

fpath=($ZSH/completions $ZSH/functions $fpath)

_jp_setprompt
