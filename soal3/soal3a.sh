#!/bin/bash
i=0
while [ $i -lt 28 ]
do
let a=$i+1
wget "https://loremflickr.com/320/240/cat" -a "wget.log" -O "pdkt_kusuma_$a"
let i=$i+1
done
