#!/bin/sh

if ps -C cmus > /dev/null; then
    substring="status playing"
    result=$(cmus-remote -C status)
    logitech="Welcome to Logitech Media Server"
    inter="franceinter"

    if [ ! "${result##*"$substring"*}" ]; then
        stream=${result#*stream }
        title=${result#*title }

        artist_title=${stream%%set*}
        stream_source=${title%%tag*}

        if [ ! "${result##*"$inter"*}" ]; then
            artist_title=""
            stream_source="France Inter"
        elif [ ! "${result##*"$logitech"*}" ]; then
            stream_source=${title%%stream*}
        fi
        echo  Now Playing:"${artist_title}" -- "${stream_source}"┊ | tr '\n' ' '
    else
        echo " ";
    fi
else
    echo " ";
fi
