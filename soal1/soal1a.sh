awk -F, 'NR > 1 {arr[$13]+=$21} END {for (i in arr) {print arr[i],i}}' Sample-Superstore.csv > output.sh
awk -F' ' '{printf "%-12s %-12s\n", $1, $2}' output.sh | LC_ALL=C sort -g > output1.sh
awk -F, '{print $1 " " $2} NR==1 {exit}' output1.sh
