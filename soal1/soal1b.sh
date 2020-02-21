awk -F, 'NR > 1 && $13 == "Central" {arr[$11]+=$21} END {for (i in arr) {print arr[i],i}}' Sample-Superstore.csv > output3.sh
awk -F' ' '{printf "%-12s %-12s %-12s\n", $1, $2, $3}' output3.sh | LC_ALL=C sort -g > output4.sh
awk -F, '{print $1 $2 $3} NR==2 {exit}' output4.sh

