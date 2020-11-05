#!/bin/sh

[ ! -r ~/.config/mbsyncrc ] && exit 0

# Download new mail
if ps -C mbsync > /dev/null; then
    exit 0
fi

mbsync -c ~/.config/mbsyncrc -a -q

# Needed for herbe notifications
export HOME=$HOME
export DISPLAY=:0
export XAUTHORITY="${HOME}/.Xauthority"

# Loop through every account in ~/.mail
for account in ~/.mail/*; do
    # Find all unread mail whose file is newer that the last time this script was run and count them
    newcount=$(find .mail/"$account"/Inbox/new -type f -newer ~/.config/neomutt/.mailsynclast 2> /dev/null | wc -l)
    # Are there any new unread mail?
    if [ "$newcount" -gt "0" ]; then
        # Send a notification
        /usr/local/bin/herbe "New Mail" "$newcount new mail in mailbox $account" &
    fi
done

# Update access time of a marker file
touch ~/.config/neomutt/.mailsynclast

# notmuch
notmuch --config ~/.config/notmuch-config new
