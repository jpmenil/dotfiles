# -*- sh -*-

# emacs keybindings
bindkey -e

# Navigate horizontally with ctrl-arrow (in addition to M-f and M-b)
# ctrl right
bindkey "\e[1;5C" emacs-forward-word
# ctrl left
bindkey "\e[1;5D" emacs-backward-word

# alt right
bindkey '^[[1;3C'       forward-word
# alt left
bindkey '^[[1;3D'       backward-word

#bindkey '^[[A'  history-substring-search-up
#bindkey '^[[B'  history-substring-search-down

