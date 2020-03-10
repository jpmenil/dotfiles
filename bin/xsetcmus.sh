#!/bin/bash

# Code inspired by content found at http://v3gard.com/2011/01/getting-cmus-to-cooperate-with-conky/

LMS="Welcome to Logitech Media Server"

if ps -C cmus > /dev/null; then
    title=`cmus-remote -Q |
            grep --text '^tag title' |
            sed -e 's/tag title //'`
    if [ "$title" == "$LMS" ]; then
        stream=`cmus-remote -Q |
            grep --text '^stream' |
            sed -e 's/stream //'`
        echo "$stream"
    else
        artist=`cmus-remote -Q | 
    	    grep --text '^tag artist' | 
	    sed '/^tag artistsort/d' | 
	    awk '{gsub("tag artist ", "");print}'`

        echo "Now Playing: $stream - $artist - $title";
    fi
else
    echo "";
fi
