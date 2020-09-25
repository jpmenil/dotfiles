#!/bin/sh

if ps -C cmus > /dev/null; then
    substring="status playing"
    result=`cmus-remote -C status`
    logitech="Welcome to Logitech Media Server"

    if [ "$result" != "${result%$substring*}" ]; then
        title=${result#*title}
        stream=${result#*stream }
        if [ "$result" = "${result%$logitech*}" ]; then
            echo  Now Playing:${stream%%set*}-${title%%tag*}┊
        else
            echo  Now Playing: ${stream%%set*}┊
        fi
    else
        echo " ";
    fi
else
    echo " ";
fi
