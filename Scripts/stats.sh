#!/bin/bash

fileItemString=$(cat value.txt |tr "\n" " ")
fileItemArray=($fileItemString)
echo "Les valeurs dans l'ordre par minute sont :" ${fileItemArray[@]} >> mean.txt

IFS=$'\n'
max=${fileItemArray[0]}
min=${fileItemArray[0]}

for i in "${fileItemArray[@]}"; do
  (( i > max )) && max=$i
  (( i < min )) && min=$i
done

difference=$(echo "$min" "$max" | awk '{print ($1-$2)/$1*100}')

echo "La valeur maximale est " $max >> mean.txt
echo "La valeur minimale est " $min >> mean.txt
echo "Le prix a changé de " $percentage >> mean.txt

#echo "Max value is $max, minimal value is $min"

curl --data chat_id="-1001548798038" --data-urlencode "text=Max value is $max, minimal value is $min, change in percentage is $difference%" "https://api.telegram.org/bot5666318311:AAE-c5TIz6oxQSBCT9a78Ypb2dWPXN767yg/sendMessage?parse_mode"