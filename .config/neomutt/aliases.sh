#!/bin/bash

ALIASFILE="$HOME/.config/neomutt/aliases.txt"
MESSAGE=$(cat)

NEWALIAS=$(echo "${MESSAGE}" | grep ^"From: " | sed s/[\,\"\']//g | awk '{$1=""; if (NF == 3) {print "alias" $0;} else if (NF == 2) {print "alias" $0 $0;} else if (NF > 3) {print "alias", tolower($(NF-1))"-"tolower($2) $0;}}')

# We never want to create some aliases
NOALIAS_PAT="facebook|twitter|amazon|github|linkedin|paypal| \
    ops@exoscale.ch|noreply"


if grep -Eq "$NOALIAS_PAT" <<< "$NEWALIAS"; then
    :
elif grep -Fxq "$NEWALIAS" "$ALIASFILE"; then
    :
else
    echo "$NEWALIAS" >> "$ALIASFILE"
fi

sort -d -i -o "$ALIASFILE" "$ALIASFILE"

echo "${MESSAGE}"
