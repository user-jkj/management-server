#!/bin/sh
#testscript1.sh

URL=http://127.0.0.1/data/img/PIA18033~orig.jpg
FILE=testdata1.dat

rm -f ${FILE}

for request in 10 20 30 40 50 100 200 300 400 500 600 700 900 1000
do
        sum=0
        for i in `seq 5`
        do
                resolt=$(ab -c 10 -n ${request} ${URL} | grep 'Requests per second' | sed -r 's/.*( +)([0-9]+\.[0-9][0-9]) .*/\2/')
                
                sum=$(echo "$sum + $resolt"|bc)
        done

        ave=$(echo "$sum / 5" | bc)
        echo "${request} ${ave}" >> ${FILE}     
done

