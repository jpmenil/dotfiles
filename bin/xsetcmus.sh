#!/bin/sh

# Code inspired by content found at http://v3gard.com/2011/01/getting-cmus-to-cooperate-with-conky/

if ps -C cmus > /dev/null; then
    title=`cmus-remote -Q |
            grep --text '^tag title' |
            sed -e 's/tag title //'`
    stream=`cmus-remote -Q |
        grep --text '^stream' |
        sed -e 's/stream //'`
    echo " Now Playing: $stream - $title";
else
    echo " ";
fi
