LAPORAN RESMI
SISTEM OPERASI



KELOMPOK : F9

**Oleh:**

Yuki Yanuar Ratna

05111740000023

Rafif Ridho

05111840000058

**Asisten Pembimbing:**

Ibrahim Tamtama Adi

5111640000018

Departemen Teknik Infomatika

Fakultas Teknologi Elektro dan Informatika Cerdas

Institut Teknologi Sepuluh Nopember (ITS)

Surabaya

2020

**Soal**

1.	Whits adalah seorang mahasiswa teknik informatika. Dia mendapatkan tugas praktikum untuk membuat laporan berdasarkan data yang ada pada file “Sample-Superstore.csv”. Namun dia tidak dapat menyelesaikan tugas tersebut. Laporan yang diminta berupa :

a.	Tentukan wilayah bagian (region) mana yang memiliki keuntungan (profit) paling sedikit

b.	Tampilkan 2 negara bagian (state) yang memiliki keuntungan (profit) paling sedikit berdasarkan hasil poin a

c.	Tampilkan 10 produk (product name) yang memiliki keuntungan (profit) paling sedikit berdasarkan 2 negara bagian (state) hasil poin b

Whits memohon kepada kalian yang sudah jago mengolah data untuk mengerjakan laporan tersebut.

*Gunakan Awk dan Command pendukung

**Jawaban :**

**Cara Pengerjaan**

1. a

```
awk -F, 'NR > 1 {arr[$13]+=$21} END {for (i in arr) {print arr[i],i}}' Sample-Superstore.csv > output.sh
awk -F' ' '{printf "%-12s %-12s\n", $1, $2}' output.sh | LC_ALL=C sort -g > output1.sh
awk -F, '{print $1 " " $2} NR==1 {exit}' output1.sh
```

1. b

```
awk -F, 'NR > 1 && $13 == "Central" {arr[$11]+=$21} END {for (i in arr) {print arr[i],i}}' Sample-Superstore.csv > output3.sh
awk -F' ' '{printf "%-12s %-12s %-12s\n", $1, $2, $3}' output3.sh | LC_ALL=C sort -g > output4.sh
awk -F, '{print $1 $2 $3} NR==2 {exit}' output4.sh
```
1. c

```
awk -F, 'NR > 1 && $11 == "Texas" {arr[$17]+=$21} END {for (i in arr) {print arr[i],i}}' Sample-Superstore.csv > output5.sh
awk -F' ' '{ print }' output5.sh | LC_ALL=C sort -g > output6.sh
awk -F, '{ print } NR==10 {exit}' output6.sh

awk -F, 'NR > 1 && $11 == "Illinois" {arr[$17]+=$21} END {for (i in arr) {print arr[i],i}}' Sample-Superstore.csv > output7.sh
awk -F' ' '{ print }' output7.sh | LC_ALL=C sort -g > output8.sh
awk -F, '{ print } NR==10 {exit}' output8.sh
```

**Kendala Yang Dialami**

-

**Screenshot**

1. a

![Screenshot1a](https://1.bp.blogspot.com/-Vs33eY70f4Y/Xk9lTyPdvqI/AAAAAAAAAxE/2rPfe6E4PBoFY0LbXzSEP3Uv7yHPV8UoQCLcBGAsYHQ/s1600/Screenshot%2Bfrom%2B2020-02-21%2B11-54-11.png)

1. b

![Screenshot1b](https://1.bp.blogspot.com/-fDGEBuQvgZY/Xk9lYkYUIKI/AAAAAAAAAxI/I9RZlDJ0haM04Cywd1qPQ6Dgh-1N4gCqgCLcBGAsYHQ/s1600/Screenshot%2Bfrom%2B2020-02-21%2B11-54-20.png)

1. c

![Screenshot1c](https://1.bp.blogspot.com/-3299B5NwpKk/Xk9ldsHvhfI/AAAAAAAAAxM/411iDkKOYFYF3IDlrWebX3NC4CcFDM3ngCLcBGAsYHQ/s1600/Screenshot%2Bfrom%2B2020-02-21%2B11-54-28.png)

**Soal**

2.	Pada suatu siang, laptop Randolf dan Afairuzr dibajak oleh seseorang dan kehilangan data-data penting. Untuk mencegah kejadian yang sama terulang kembali mereka meminta bantuan kepada Whits karena dia adalah seorang yang punya banyak ide. Whits memikirkan sebuah ide namun dia meminta bantuan kalian kembali agar ide tersebut cepat diselesaikan. Idenya adalah kalian (a) membuat sebuah script bash yang dapat menghasilkan password secara acak sebanyak 28 karakter yang terdapat huruf besar, huruf kecil, dan angka. (b) Password acak tersebut disimpan pada file berekstensi
.txt dengan nama berdasarkan argumen yang diinputkan dan HANYA berupa alphabet.
(c) Kemudian supaya file .txt tersebut tidak mudah diketahui maka nama filenya akan di enkripsi dengan menggunakan konversi huruf (string manipulation) yang disesuaikan dengan jam(0-23) dibuatnya file tersebut dengan program terpisah dengan (misal: password.txt dibuat pada jam 01.28 maka namanya berubah menjadi qbttxpse.txt dengan perintah ‘bash soal2_enkripsi.sh password.txt’. Karena p adalah huruf ke 16 dan file dibuat pada jam 1 maka 16+1=17 dan huruf ke 17 adalah q dan begitu pula seterusnya. Apabila melebihi z, akan kembali ke a, contoh: huruf w dengan jam 5.28, maka akan menjadi huruf b.) dan (d) jangan lupa untuk membuat dekripsinya supaya nama file bisa kembali.

HINT: enkripsi yang digunakan adalah caesar cipher.
*Gunakan Bash Script

**Jawaban :**

**Cara Pengerjaan**

**Membuat Password**

```
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
```

**Enkripsi**

```
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
```

**Dekripsi**

```
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
```

**Kendala Yang Dialami**

Setelah masuk tr command, variabel abjad yang didefinisikan di awal tidak dimulai dari indeks 0 sehingga perlu ditambahkan menjadi "aabcdefghijklmnopqrstuvwxyz" agar membacanya dari huruf a.

**Screenshot**

2. a

![Screenshot2a](https://1.bp.blogspot.com/-uNx_k_aK7p8/Xk9u6DJNPCI/AAAAAAAAAxc/HbkdMu5WGbAz_kaCmKGfRzQ1JaLxAYktgCLcBGAsYHQ/s1600/Screenshot%2Bfrom%2B2020-02-21%2B12-44-59.png)

2. b

![Screenshot2a1](https://1.bp.blogspot.com/-ipN1GYKDJEA/Xk9u-L2L-uI/AAAAAAAAAxg/s_NhnE4e-1AW2NogBTgU3VN35JFpvsvZACLcBGAsYHQ/s1600/Screenshot%2Bfrom%2B2020-02-21%2B12-45-29.png)

2. c

![Screenshot2a1](https://1.bp.blogspot.com/-QDt2XCI4MxQ/Xk9vCH6yuBI/AAAAAAAAAxk/9crKvVy5cCcOI4E2XRScXNxQV9hSzKzpwCLcBGAsYHQ/s1600/Screenshot%2Bfrom%2B2020-02-21%2B12-46-57.png)

**Soal**

3.	1 tahun telah berlalu sejak pencampakan hati Kusuma. Akankah sang pujaan hati kembali ke naungan Kusuma? Memang tiada maaf bagi Elen. Tapi apa daya hati yang sudah hancur, Kusuma masih terguncang akan sikap Elen. Melihat kesedihan Kusuma, kalian mencoba menghibur Kusuma dengan mengirimkan gambar kucing. [a] Maka dari itu, kalian mencoba membuat script untuk mendownload 28 gambar dari "https://loremflickr.com/320/240/cat" menggunakan command wget dan menyimpan file dengan nama "pdkt_kusuma_NO" (contoh: pdkt_kusuma_1, pdkt_kusuma_2, pdkt_kusuma_3) serta jangan lupa untuk menyimpan log messages wget kedalam sebuah file "wget.log". Karena kalian gak suka ribet, kalian membuat penjadwalan untuk menjalankan script download gambar tersebut. Namun, script download tersebut hanya berjalan[b] setiap 8 jam dimulai dari jam 6.05 setiap hari kecuali hari Sabtu Karena gambar yang didownload dari link tersebut bersifat random, maka ada kemungkinan gambar yang terdownload itu identik. Supaya gambar yang identik tidak dikira Kusuma sebagai spam, maka diperlukan sebuah script untuk memindahkan salah satu gambar identik. Setelah memilah gambar yang identik, maka dihasilkan gambar yang berbeda antara satu dengan yang lain. Gambar yang berbeda tersebut, akan kalian kirim ke Kusuma supaya hatinya kembali ceria. Setelah semua gambar telah dikirim, kalian akan selalu menghibur Kusuma, jadi gambar yang telah terkirim tadi akan kalian simpan kedalam folder /kenangan dan kalian bisa mendownload gambar baru lagi. [c] Maka dari itu buatlah sebuah script untuk mengidentifikasi gambar yang identik dari keseluruhan gambar yang terdownload tadi. Bila terindikasi sebagai gambar yang identik, maka sisakan 1 gambar dan pindahkan sisa file identik tersebut ke dalam folder ./duplicate dengan format filename "duplicate_nomor" (contoh : duplicate_200, duplicate_201). Setelah itu lakukan pemindahan semua gambar yang tersisa kedalam folder ./kenangan dengan format filename "kenangan_nomor" (contoh: kenangan_252, kenangan_253). Setelah tidak ada gambar di current directory, maka lakukan backup seluruh log menjadi ekstensi ".log.bak". Hint : Gunakan wget.log untuk membuat location.log yang isinya merupakan hasil dari grep "Location".
*Gunakan Bash, Awk dan Crontab

**Jawaban :**

**Cara Pengerjaan**

**3a**
```
for ((i=1 ; $i -le 28 ; i++))
do
	wget "https://loremflickr.com/320/240/cat" -a "wget.log" -O "pdkt_kusuma_$i"
done
```
**3b**
```
5 6-23/8 * * 0-5 /home/rafif/rafif/modul1/soal3a.sh
```
**3c**

**Kendala Yang Dialami**
Tidak bisa mengerjakan nomor 3c

**Screenshot**

3.

![Screenshot3](https://1.bp.blogspot.com/-SkGEGXdxy2I/Xk-1nauDfAI/AAAAAAAAAx4/tBM0UFendKot8CJnVsFUudJLonJ_PC6BgCLcBGAsYHQ/s1600/image.png)
