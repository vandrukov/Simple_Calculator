#!/usr/bin/env bash

echo "Enter an arithmetic operation:"
read input
re='^-?[0-9]+ [+*-/] -?[0-9]+$'
if [[ "$input" =~ $re ]]; then
     echo $(( $input ))
else
    echo "Operation check failed!"
fi
