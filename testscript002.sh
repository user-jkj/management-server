#!/bin/sh

FILE=test1.dat
URL=http://127.0.0.1/data
rm -f ${FILE}
# サイズごとのループ
for size in 10 50 100 500 1000 5000 10000
do
  sum=0
  # リクエストを10回送るループ
  for request in `seq 10`
  do
    # Apache Benchmark (ab) コマンドでリクエストを送信し、Requests per second の値を取得
    TEST=$(ab -c 10 -n ${size} ${URL} | grep 'Requests per second' | sed -r 's/.*( +)([0-9]+\.[0-9][0-9]) .*/\2/')
  
    # リクエスト毎の結果を合計
    sum=$(echo "$sum + $TEST" | bc)
  done

  # 平均値を計算
  average=$(echo "scale=2; $sum / 10" | bc)

  # 結果をファイルに書き込み
  echo "${size} ${average}" >> ${FILE}
done
