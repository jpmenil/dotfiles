## Command history configuration
if [ -z "$HISTFILE" ]; then
    HISTFILE=$HOME/.zsh_history
fi

HISTSIZE=10000
SAVEHIST=10000

# Show history
case $HIST_STAMPS in
  "mm/dd/yyyy") alias history='fc -fl 1' ;;
  "dd.mm.yyyy") alias history='fc -El 1' ;;
  "yyyy-mm-dd") alias history='fc -il 1' ;;
  *) alias history='fc -l 1' ;;
esac

# append
setopt append_history
# no duplicate
setopt hist_ignore_all_dups
# ignore space prefixed commands
unsetopt hist_ignore_space
# trim blanks
setopt hist_reduce_blanks
# show before executing history commands
setopt hist_verify
# add commands as they are typed, don't wait until shell exit
setopt inc_append_history
# share hist between sessions 
setopt share_history
# !keyword
setopt bang_hist

setopt extended_history

#setopt hist_ignore_space
