export PATH="$HOME/bin/:$HOME/.local/bin:$HOME/go/bin:$PATH"

if [ -z "$DISPLAY" ] && [ "$(fgconsole)" -eq 1 ]; then
    exec startx -- vt1
fi
