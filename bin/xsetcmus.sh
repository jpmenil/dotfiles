#!/bin/sh

if ps -C cmus > /dev/null; then
    substring="status playing"
    result=`cmus-remote -C status`

    if [ "$result" != "${result%$substring*}" ]; then
        title=${result#*title}
        stream=${result#*stream }
        echo  Now Playing: ${stream%%set*}-${title%%tag*}┊
    else
        echo " ";
    fi
else
    echo " ";
fi
