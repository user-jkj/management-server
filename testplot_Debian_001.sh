#!/bin/sh
#testplot.sh

gnuplot << EOF
set terminal png
set output "testplot.png"
set xlabel "Number of Access"
set ylabel "Requests per second"
set title "Debian httpd,RPS with total access count 10-1000"
plot 'testdata1.dat' with lines title "Debian httpd,concurrently 10",  'testdata2.dat' with lines title "Debian httpd,concurrently 50"
exit
EOF

echo "plot success!"