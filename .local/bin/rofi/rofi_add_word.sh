#!/bin/bash
cat "/home/arianna/.words.txt"
if [[ "$1" != "" ]]
then
    word=$(echo "$1" | tr -d '\n')
    echo $word >> "/home/arianna/.words.txt"
fi
