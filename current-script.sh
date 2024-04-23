#!/bin/bash/

NAME1=KRISHNA
NAME2=Vaishnavi
G="\e[32m"
N="\e[0m"

echo -e "This is $NAME1 from $G current $N SCRIPT"
echo "PID: $$"

## ./Other-script.sh
## PID will be different for above approach

source /home/ec2-user/shell-script/Other-script.sh
## PID will be sae in this approach 

echo -e "This is $NAME2 from $G current $N SCRIPT"