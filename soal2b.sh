#!/bin/bash

jam="$( date +"%H" )"

alpha=({a..z})
encrypt=( "${alpha[@]:(-(26-$jam))}" )
encrypt+=( "${alpha[@]:0:$jam}" )

alpha1=({A..Z})
encrypt1=( "${alpha1[@]:(-(26-$jam))}" )
encrypt1+=( "${alpha1[@]:0:$jam}" )

variab=$1

echo "$variab" | tr "${alpha[*]}" "${encrypt[*]}"| tr "${alpha1[*]}" "${encrypt1[*]}" > encryptt.txt
value=$(<encryptt.txt)
mv "$variab.txt" "$value.txt"
