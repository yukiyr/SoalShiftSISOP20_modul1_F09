$1/bin/bash

for ((i=1 ; $i<=28 ;  i++))
do
wget "https://loremflickr.com/320/240/cat" -a "wget.log" -O "pdkt_kusuma_$i"
done
