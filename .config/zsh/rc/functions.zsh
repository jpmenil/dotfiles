# -*- sh -*-

# Functions

function mfa () {
    oathtool --base32 --totp "$(pass show $1/2fa)" | xclip -selection clipboard ;
}

function fk() {
    ps aux | grep $1 | grep -v grep | awk '{print $2}' | xargs kill -9
}

function rmssh () {
    sed -i "/$1/d" ~/.ssh/known_hosts
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
