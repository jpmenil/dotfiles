export ZSH=$HOME/.config/zsh

autoload -U add-zsh-hook

() {
    for config_file ($ZSH/rc/*.zsh) source $config_file
}

# Bashquese Ctrl-W
autoload -U select-word-style
select-word-style bash

fpath=($ZSH/completions $ZSH/functions $fpath)

_jp_setprompt
