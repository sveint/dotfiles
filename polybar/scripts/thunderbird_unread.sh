#!/bin/bash -ue

STATUS=$(grep '(^94=.)' /home/sveint/.thunderbird/*/ImapMail/*/INBOX.msf | tail -1 | cut -d'=' -f2 | cut -d')' -f1)
if [[ ${STATUS} != "0" ]]; then
    echo "Unread mail"
else
    echo "No unread mail"
fi

