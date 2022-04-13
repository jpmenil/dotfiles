#!/bin/bash

# create a temporary named pipe to communicate with bluealsa-cli monitor
FIFO_PATH=$(mktemp -u)
mkfifo $FIFO_PATH
# attach it to unused file descriptor FIFO_FD
exec {FIFO_FD}<>$FIFO_PATH
# unlink the named pipe
rm $FIFO_PATH

# make sure the pipeline is shut down if this script interrupted
trap "kill %1; exec {FIFO_FD}>&-; ln -sf /dev/null ~/.asoundrc-default; exit 0" INT TERM

# start bluealsa-cli monitor in background
bluealsa-cli --quiet monitor >&$FIFO_FD &

until false; do
	if [[ $(bluealsa-cli --quiet list-pcms | grep -Ec '/a2dp(src|sink)/sink$') -gt 0 ]] ; then
		ln -sf ~/.asoundrc-bluealsa ~/.asoundrc-default
	else
		ln -sf /dev/null ~/.asoundrc-default
	fi
	read
done <&$FIFO_FD
