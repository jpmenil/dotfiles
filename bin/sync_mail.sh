#!/bin/zsh

# Download new mail
mbsync -q -a

# Loop through every account in ~/.mail
for account in $(ls ~/.mail); do
    # Find all unread mail whose file is newer that the last time this script was run and count them
    newcount=$(find ~/.mail/$account/Inbox/new/ -type f -newer ~/.config/neomutt/.mailsynclast 2> /dev/null | wc -l)
    # Are there any new unread mail?
    if [ "$newcount" -gt "0" ]; then
        # Send a notification
        notify-send "New Mail" "$newcount new mail in mailbox $account" &
    fi
done

# Update access time of a marker file
touch ~/.config/neomutt/.mailsynclast
