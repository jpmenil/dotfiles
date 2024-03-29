# -*- sh -*-

export GOPATH="$HOME/go"
export GREP_COLORS='ms=01;32:mc=01;31:sl=:cx=:fn=33:ln=32:bn=32:se=36'
export LS_COLORS="di=0;36:ln=0;31:so=37:pi=1;35:ex=37:bd=37:cd=37:su=37:sg=37:tw=0;36:ow=0;36"
export PAGER="less"
export VISUAL="emacsclient -nw"
export EDITOR=$VISUAL
export XDG_CONFIG_HOME="$HOME/.config"

# gpg & ssh
if [ -z $SSH_TTY ]; then
    export GPG_TTY=$(tty)
    export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
    gpg-connect-agent -q updatestartuptty /bye >> /dev/null
fi
