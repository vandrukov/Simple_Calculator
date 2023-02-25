#!/usr/bin/env bash
#Both the standard output and standard error streams will be copied to the 
#file while still being visible in the terminal. 
#If the file already exists, it gets overwritten
echo "Welcome to the basic calculator!" |& tee operation_history.txt

while true; do
    echo "Enter an arithmetic operation or type 'quit' to quit:" | tee -a operation_history.txt
    read answer
    echo "$answer" >> operation_history.txt
    if [ "$answer" = "quit" ]; then
        echo "Goodbye!" | tee -a operation_history.txt
        break
    else
        re='^-?[0-9]+(.[0-9]+)? [+*-^/] -?[0-9]+(.[0-9]+)?$'
        if [[ "$answer" =~ $re ]]; then
            arithmetic_result=$(echo "scale=2; $answer" | bc -l)
            echo $arithmetic_result | tee -a operation_history.txt
        else
            echo "Operation check failed!" | tee -a operation_history.txt
        fi   
    fi
done
