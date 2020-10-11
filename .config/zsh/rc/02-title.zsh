# -*- sh -*-

_title_precmd () {
    print -Pn "\e]2;%n@%m %~\a"
}

_title_preexec () {
    print -Pn "\e]2;$1\a"
}

autoload -U add-zsh-hook
add-zsh-hook precmd _title_precmd
add-zsh-hook preexec _title_preexec
