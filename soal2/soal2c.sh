#!/bin/bash

hurufkecil=(a b c d e f g h i j k l m n o p q r s t u v w x y z)
hurufbesar=(A B C D E F G H I J K L M N O P Q R S T U V W X Y Z)

abjad=aabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz
abjad2=AABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZ

hour=$1
jam="$( date +"%H" )"

bawah="${hurufkecil[$jam]}"
atas="${hurufbesar[$jam]}"

echo "$hour" | tr "[$bawah-za-$bawah]" "${abjad:0:28}" | tr "[$atas-ZA-$atas]" "${abjad2:0:28}" > decryptt.txt
value=$(<decryptt.txt)
mv "$hour.txt" "$value.txt"
