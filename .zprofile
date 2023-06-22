# -*- sh -*-

typeset -U PATH
export PATH="$HOME/bin/:$HOME/.cargo/bin:$HOME/.local/bin:$HOME/go/bin:/opt/homebrew/bin:$PATH"

if [ "$(uname -s)" = "Linux" ] && [ -z "$DISPLAY" ] && [ -z "$SSH_TTY" ] && [ "$(fgconsole)" -eq 1 ]; then
    startx -- -nolisten tcp -nolisten local vt1
fi
