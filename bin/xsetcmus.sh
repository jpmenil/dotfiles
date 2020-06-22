#!/bin/sh

if ps -C cmus > /dev/null; then
    result=`cmus-remote -C status`
    title=${result#*title}
    stream=${result#*stream }
    echo  Now Playing: ${stream%%set*}-${title%%tag*}┊
else
    echo " ";
fi
