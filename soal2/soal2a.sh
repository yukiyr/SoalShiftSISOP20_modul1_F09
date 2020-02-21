#!/bin/bash

length=28
digits=({0..9})
lower=({a..z})
upper=({A..Z})
CharArray=(${digits[*]} ${lower[*]} ${upper[*]})
ArrayLength=${#CharArray[*]}
password=""
for i in `seq 1 $length`
do        
	index=$(($RANDOM%$ArrayLength))    
	char=${CharArray[$index]}        
	password=${password}${char}
done 

fname=$1

echo $password > "$fname.txt"
