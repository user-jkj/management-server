#!/bin/sh
#testscript1.sh

URL=http://127.0.0.1/data/img/GRC-2022-CM-0102~orig.mp4
FILE=test1.dat

rm -f ${FILE}


for request in 10 20 30 40 50 100 200 300 400 500 600 700 900 1000
do
        echo -n ${request}' ' >> ${FILE}
        ab -c 10 -n ${request} ${URL} | grep 'Requests per second' | sed -r 's/.*( +)([0-9]+\.[0-9][0-9]) .*/\2/' >> ${FILE}
done
