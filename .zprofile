export PATH="$HOME/bin/:$HOME/.local/bin:$HOME/go/bin:$PATH"

if [ -z "$DISPLAY" ] && [ "$(fgconsole)" -eq 1 ]; then
    startx -- -nolisten tcp -nolisten local vt1
fi
