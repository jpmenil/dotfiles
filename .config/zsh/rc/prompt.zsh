# -*- sh -*-

_jp_prompt () {
    local PR_USER PR_USER_OP PR_PROMPT PR_HOST

    # Check the UID
    if [[ $UID -ne 0 ]]; then # normal user
        PR_USER='%F{117}%n%f'
        PR_USER_OP='%F{blue}%#%f'
        PR_PROMPT='%f➤%f'
    else # root
        PR_USER='%F{red}%n%f'
        PR_USER_OP='%F{red}%#%f'
        PR_PROMPT='%F{red}➤%f'
    fi

    if [[ -n "$SSH_TTY" ]]; then
        PR_HOST='%F{083}%M%f'
    else
        PR_HOST='%F{cyan}%M%f'
    fi

    if [ -n "$PIPENV_ACTIVE" ]; then
        venv=${VIRTUAL_ENV#*virtualenvs/}
        local pip_env='(${venv%-*})'
    fi

    if [ -n "$AWS_VAULT" ]; then
        local aws_vault='${AWS_VAULT} ${AWS_SESSION_EXPIRATION}'
    fi

    local return_code="%(?..%F{red}%? ↵%f)"
    local user_host="${PR_USER}%F{grey}@${PR_HOST}"
    local current_dir="%B%F{45}%~%f%b"
    local git_branch='${vcs_info_msg_0_}'

    PROMPT="╭─${user_host} ${current_dir} ${git_branch} ${pip_env} ${aws_vault}
╰─$PR_PROMPT"
    RPROMPT="${return_code}"
}

_jp_setprompt () {
    setopt prompt_subst
    _jp_prompt
    PROMPT_EOL_MARK="%B${PRCH[eol]}%b"
    unset RPROMPT
    unset RPS1
}
