# -*- sh -*-

# Remove / from WORDCHARS (more like bash)
#WORDCHARS=${WORDCHARS:s#/#}
WORDCHARS='*?_[]~=&;!#$%^(){}<>'        # without /

# when completing from the middle of a word, move the cursor to the end of the word
setopt always_to_end
# Maintain directories in a heap
setopt autopushd
# Don't need to use `cd`
setopt autocd
# automatically list choices on ambiguous completion
setopt auto_list
# automatically use menu completion
setopt auto_menu
# move cursor to end if word had one match
setopt always_to_end
# resolve symlinks
setopt chase_links
# allow completion from within a word/phrase
setopt complete_in_word
# complete aliases
setopt completealiases
# spelling correction for commands
setopt correct
# hash everything before completion
setopt hash_list_all
# complete as much of a completion until it gets ambiguous.
setopt list_ambiguous
# Never beep
setopt nobeep
# print return value if non-zero
setopt print_exit_value
# ask for confirmation for `rm *' or `rm path/*'
#unsetopt rm_star_silent
