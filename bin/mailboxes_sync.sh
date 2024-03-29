#!/bin/sh

[ ! -r ~/.config/mbsyncrc ] && exit 0

# No need to run if no key
if ! gpg --card-status all | grep 612B82125CCAB524 > /dev/null; then
    exit 0
fi

# Download new mail
if ps -C mbsync > /dev/null; then
    exit 0
fi

mbsync -c ~/.config/mbsyncrc -a -q

# Needed for herbe notifications
export HOME=$HOME
export DISPLAY=:0
export XAUTHORITY="${HOME}/.Xauthority"

prefix="${HOME}/.mail/"

# Loop through every account in ~/.mail
for account in "$prefix"*; do
    # Find all unread mail whose file is newer that the last time this script was run and count them
    newcount=$(find "$account"/Inbox/new -type f -newer ~/.config/neomutt/.mailsynclast 2> /dev/null | wc -l)
    # Are there any new unread mail?
    if [ "$newcount" -gt "0" ]; then
        # Send a notification
        /usr/local/bin/herbe "New Mail" "$newcount new mail in mailbox ${account#"$prefix"}" &
    fi
done

# Update access time of a marker file
touch ~/.config/neomutt/.mailsynclast

# notmuch
#notmuch --config ~/.config/notmuch-config new
