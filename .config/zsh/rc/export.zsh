# -*- sh -*-

#export PATH="$HOME/bin/:$HOME/.local/bin:$PATH"
#export PATH="$HOME/go/bin:$PATH"
export GOPATH="$HOME/go"

export VISUAL="qe"
export EDITOR=$VISUAL
export GREP_COLOR='1;32'

export GPG_TTY=$(tty)
export SSH_AUTH_SOCK="${HOME}/.gnupg/S.gpg-agent.ssh"
gpg-connect-agent -q updatestartuptty /bye >> /dev/null
