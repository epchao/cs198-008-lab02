#!/bin/bash

PHONEBOOK_ENTRIES="bash_phonebook_entries"


if [ "$#" -lt 1 ]; then
    exit 1

elif [ "$1" = "new" ] && [ -n "$2" ] && [ -n "$3" ]; then
    echo "$2 $3" >> $PHONEBOOK_ENTRIES 

elif [ "$1" = "list" ]; then
    if [ ! -e $PHONEBOOK_ENTRIES ] || [ ! -s $PHONEBOOK_ENTRIES ]; then
        echo "phonebook is empty"
    else
        cat $PHONEBOOK_ENTRIES
    fi

elif [ "$1" = "lookup" ] && [ -n "$2" ] ; then
    grep "$2" $PHONEBOOK_ENTRIES

elif [ "$1" = "remove" ] && [ -n "$2" ] ; then
    sed -i "/$2 [0-9]\{3\}-[0-9]\{3\}-[0-9]\{4\}/d" $PHONEBOOK_ENTRIES

elif [ "$1" = "clear" ]; then
    rm $PHONEBOOK_ENTRIES

else
    echo "Invalid operation!"

fi
