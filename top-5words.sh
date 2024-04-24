#!/bin/bash/

wordcount=$(grep -o '\w*' file.txt | sort | uniq -c | sort -nr | head -5)


echo "Top five word count: $wordcount"


#for i in $wordcount 
#do 
#    echo "word count: $i"
#done