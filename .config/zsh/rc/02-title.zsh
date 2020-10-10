# -*- sh -*-

_title_precmd () {
    print -Pn "\e]1;%n%f\a"
    print -Pn "\e]2;%n@%m %~\a"
}

_title_preexec () {
    print -Pn "\e]1;%2~\a"
    printf "\x1b]0;%s\x07" "$1"
}

autoload -U add-zsh-hook
add-zsh-hook precmd _title_precmd
add-zsh-hook preexec _title_preexec
