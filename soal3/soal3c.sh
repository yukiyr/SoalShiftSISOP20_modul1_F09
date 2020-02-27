jumlahK=1
jumlahD=1

for ((f=1 ; f<=28 ; f++))
do
        for ((p=f+1 ; p<=28 ; p++))
        do
                sama=$(compare -metric AE pdkt_kusuma_$f pdkt_kusuma_$p null: 2>&1)
                if [[ $sama == 0 ]]
                then
                        mv pdkt_kusuma_$p duplicate/duplicate_$jumlahD
                        ((jumlahD=jumlahD+1))
                fi
        done
done

for ((f=1 ; f<=28 ; f++))
do
        if [[ -f pdkt_kusuma_$f ]]
        then
                mv pdkt_kusuma_$f kenangan/kenangan_$jumlahK
                ((jumlahK=jumlahK+1))
        fi
done

cp wget.log wget.log.bak
