# Background process
setopt NO_HUP
setopt NO_CHECK_JOBS

# http://ivyl.0xcafe.eu/2013/02/03/refining-zsh/
# Clobber - how to not override existing file
# To override file use >| instead of >
# cat >| foo #=> OK
setopt NOCLOBBER

# History options
setopt EXTENDED_HISTORY
setopt INC_APPEND_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_REDUCE_BLANKS
setopt HIST_VERIFY

