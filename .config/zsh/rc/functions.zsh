# -*- sh -*-

# Functions

# MOTD
function echo_color() {
    local color="$1"
    #printf "${color}$2\033[0m\n"
    printf "${color}$2\n"
}
#echo_color "\033[0;33m" "c-b Move backward     c-f Move forward"
#echo_color "\033[0;33m" "c-p Move up           c-n Move down"
#echo_color "\033[0;33m" "c-a Beginning of line c-e End of line"
#echo_color "\033[0;33m" "c-d Delete forward    c-h Delete backward"
#echo_color "\033[0;33m" "c-k Delete forward to end of line"
#echo_color "\033[0;33m" "c-u Delete entire line"
#echo_color "\033[0;33m" "a-b Word to left       a-f Word to right"

function mfa () {
    oathtool --base32 --totp "$(pass show $1/2fa)" | xclip -selection clipboard ;
}

#function hostname_ssh () {
#	tty=${1:-$(tmux display -p '#{pane_tty}')}
#	ssh_parameters=$(ps -t "$tty" -o command= | awk '/ssh/ && !/-W/ { $1=""; print $0; exit }')
#	hostname=$(ssh -G $ssh_parameters 2>/dev/null | awk 'NR > 2 { exit } ; /^hostname / { print $2 }')
#	echo $hostname
#}

function rmssh () {
    sed -i "/$1/d" ~/.ssh/known_hosts
}

susu() {
    command sudo -H -u ${1:-root} \
        env ZDOTDIR=${ZDOTDIR:-$HOME} \
            ZSH=$ZSH ${DISPLAY+DISPLAY=$DISPLAY} \
            ${SSH_TTY+SSH_TTY=$SSH_TTY} \
            ${SSH_AUTH_SOCK+SSH_AUTH_SOCK=$SSH_AUTH_SOCK} \
            ${ZSH_NAME} -i -l
}

extract() {
    # Extract most know archives with one command
    # http://alias.sh/extract-most-know-archives-one-command
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)   tar xjvf $1    ;;
            *.tar.gz)    tar xzvf $1    ;;
            *.tar.xz)    tar Jxvf $1    ;;
            *.bz2)       bunzip2 $1     ;;
            *.rar)       unrar e $1     ;;
            *.gz)        gunzip $1      ;;
            *.tar)       tar xvf $1      ;;
            *.tbz2)      tar xjvf $1     ;;
            *.tgz)       tar xzvf $1     ;;
            *.zip)       unzip $1       ;;
            *.Z)         uncompress $1  ;;
            *.7z)        7z x $1        ;;
            *)     echo "'$1' cannot be extracted via extract()" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

# Automatic pipenv shell activation/deactivation
_togglePipenvShell() {
    # deactivate shell if Pipfile doesn't exist and not in a subdir
    if [[ ! -a "$PWD/Pipfile" ]]; then
        if [[ "$PIPENV_ACTIVE" == 1 ]]; then
            if [[ "$PWD" != "$pipfile_dir"* ]]; then
                exit
            fi
        fi
    fi

    # activate the shell if Pipfile exists
    if [[ "$PIPENV_ACTIVE" != 1 ]]; then
        if [[ -a "$PWD/Pipfile" ]]; then
            export pipfile_dir="$PWD"
            pipenv shell
        fi
    fi
}
chpwd_functions+=(_togglePipenvShell)
