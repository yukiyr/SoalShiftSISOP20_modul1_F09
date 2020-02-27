awk -F, 'NR > 1 && $11 == "Texas" {arr[$17]+=$21} END {for (i in arr) {print arr[i],i}}' Sample-Superstore.csv > output5.sh
awk -F' ' '{ print }' output5.sh | LC_ALL=C sort -g > output6.sh
awk -F, '{ print } NR==10 {exit}' output6.sh

awk -F, 'NR > 1 && $11 == "Illinois" {arr[$17]+=$21} END {for (i in arr) {print arr[i],i}}' Sample-Superstore.csv > output7.sh
awk -F' ' '{ print }' output7.sh | LC_ALL=C sort -g > output8.sh
awk -F, '{ print } NR==10 {exit}' output8.sh
