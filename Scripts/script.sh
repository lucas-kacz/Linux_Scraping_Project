#!/bin/bash

curl=$(which curl)
outfile="output.txt"
url="https://www.coingecko.com/fr/pi%C3%A8ces/cosmos-hub"

curl https://www.coingecko.com/fr/pi%C3%A8ces/cosmos-hub > out.txt

variable="$(cat out.txt | grep -oP '(?<=<span class="no-wrap">).*(?=</span>)')"
finale="${variable:0:6}"
#echo $finale

function dump_webpage(){
        $curl -o $outfile $url
}

function recup_prix(){
        echo "Le prix de l'ATOM est actuellement de: "
        #grep -o -P -m 1 '(?<=1481).*(?=</span>)' $outfile
        var1="$(grep -oP '(?<=<span class="no-wrap">).*(?=</span>)' $outfile)"
        prix="${var1:0:6}"
        prix1="${var1:1:5}"
        echo "$prix1" >> value.txt
        echo $prix
}


#curl https://www.coingecko.com/fr/pi%C3%A8ces/cosmos-hub --output result.txt
dump_webpage
recup_prix


time=$( date '+%F %H:%M:%S')

curl --data chat_id="-1001548798038" --data-urlencode "text=Bonjour, le prix de l'Atom est de $prix et nous sommes actuellement le $time " "https://api.telegram.org/bot5666318311:AAE-c5TIz6oxQSBCT9a78Ypb2dWPXN767yg/sendMessage?parse_mode"