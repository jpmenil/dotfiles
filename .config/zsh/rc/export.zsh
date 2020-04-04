# -*- sh -*-

export LS_COLORS="di=10;36:ln=1;31:so=37:pi=1;35:ex=37:bd=37:cd=37:su=37:sg=37:tw=1;36:ow=1;36"

export GOPATH="$HOME/go"

export VISUAL="qe"
export EDITOR=$VISUAL
export GREP_COLOR='1;32'

export GPG_TTY=$(tty)
export SSH_AUTH_SOCK="${HOME}/.gnupg/S.gpg-agent.ssh"
gpg-connect-agent -q updatestartuptty /bye >> /dev/null
