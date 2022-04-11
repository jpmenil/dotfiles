# -*- sh -*-

# Incorporate git information into prompt
[[ $USERNAME != "root" ]] && [[ $ZSH_NAME != "zsh-static" ]] && {

    # Async helpers
    _jp_vcs_async_start() {
        async_start_worker vcs_info
        async_register_callback vcs_info _jp_vcs_info_done
    }
    _jp_vcs_info() {
        cd -q $1
        vcs_info
        print ${vcs_info_msg_0_}
    }
    _jp_vcs_info_done() {
        local job=$1
        local return_code=$2
        local stdout=$3
        local more=$6
        if [[ $job == '[async]' ]]; then
            if [[ $return_code -eq 2 ]]; then
                # Need to restart the worker. Stolen from
                # https://github.com/mengelbrecht/slimline/blob/master/lib/async.zsh
                _jp_vcs_async_start
                return
            fi
        fi
        vcs_info_msg_0_=$stdout
        [[ $more == 1 ]] || zle reset-prompt
    }

    _jp_vcs_chpwd() {
        vcs_info_msg_0_=
    }
    _jp_vcs_precmd() {
        async_flush_jobs vcs_info
        async_job vcs_info _jp_vcs_info $PWD
    }

    autoload -Uz vcs_info

    zstyle ':vcs_info:*' enable git
    () {
        local formats="%F{yellow}[%b%c%u%f%F{yellow}]%f"
        local actionformats="${formats}%{${fg[default]}%} ${PRCH[sep]} %{${bg[yellow]}%}%a"
        zstyle ':vcs_info:*:*' formats           $formats
        zstyle ':vcs_info:*:*' actionformats     $actionformats
        zstyle ':vcs_info:*:*' stagedstr         "%{%F{cyan}${PRCH[circle]}%f+"
        zstyle ':vcs_info:*:*' unstagedstr       "%{%F{blue}${PRCH[circle]}%f!"
        zstyle ':vcs_info:*:8' check-for-changes true
        #zstyle    ':vcs_info:*+*:*' debug true
        zstyle ':vcs_info:git*+set-message:*' hooks git-untracked

        +vi-git-untracked(){
            if [[ $(git rev-parse --is-inside-work-tree 2> /dev/null) == 'true' ]] && \
                git status --porcelain 2> /dev/null | grep -q '??' ; then
                    hook_com[staged]+="%{${fg[black]}%}${PRCH[circle]}"
            fi
        }
    }

    # Asynchronous VCS status
    source $ZSH/third-party/async.zsh
    async_init
    _jp_vcs_async_start
    add-zsh-hook precmd _jp_vcs_precmd
    add-zsh-hook chpwd _jp_vcs_chpwd
}
