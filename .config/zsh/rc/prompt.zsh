# -*- sh -*-

#setopt prompt_subst

_jp_prompt () {

        local PR_USER PR_USER_OP PR_PROMPT PR_HOST

        # Check         the UID
        if [[ $UID -ne 0 ]]; then # normal user
              #  PR_USER='%F{blue}%n%f'
                PR_USER='%F{117}%n%f'
                PR_USER_OP='%F{blue}%#%f'
                PR_PROMPT='%f➤%f'
        else # root
                PR_USER='%F{red}%n%f'
                PR_USER_OP='%F{red}%#%f'
                PR_PROMPT='%F{red}➤%f'
        fi

        # Check if we are on SSH or not
        if [[ -n "$SSH_CLIENT"  ||  -n "$SSH2_CLIENT" ]]; then
                PR_HOST='%F{083}%M%f' # SSH
        else
                PR_HOST='%F{cyan}%M%f' # no SSH
        fi

        local return_code="%(?..%F{red}%? ↵%f)"

        local user_host="${PR_USER}%F{grey}@${PR_HOST}"
        #local current_dir="%B%F{blue_light}%~%f%b"
        #local current_dir="%B%F{105}%~%f%b"
        local current_dir="%B%F{45}%~%f%b"
        local git_branch='$(git_prompt_info)'

        PROMPT="╭─${user_host} ${current_dir} ${git_branch}
╰─$PR_PROMPT"
        RPROMPT="${return_code}"

        ZSH_THEME_GIT_PROMPT_PREFIX="%F{yellow}‹"
        ZSH_THEME_GIT_PROMPT_SUFFIX="› %f"

        # LS colors, made with http://geoff.greer.fm/lscolors/
        #export LSCOLORS="gagagagagagagagagagaga"
        #export LS_COLORS='di=36;40:ln=36;40:so=36;40:pi=36;40:ex=36;40:bd=36;40:cd=36;40:su=36;40:sg=36;40:tw=36;40:ow=36;40'

}

_jp_setprompt () {
        setopt prompt_subst
        _jp_prompt
        PROMPT_EOL_MARK="%B${PRCH[eol]}%b"
        unset RPROMPT
        unset RPS1
}
