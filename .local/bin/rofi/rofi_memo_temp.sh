#!/bin/bash
cat "/home/arianna/.memo_temp.txt"
if [[ "$1" != "" ]]
then
    add=$(echo "$1" | tr -d '\n')
    echo $add >> "/home/arianna/.memo_temp.txt"
fi

