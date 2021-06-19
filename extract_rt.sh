#! /bin/bash


file_rt_log=~/.chia/mainnet/log/response_times.log
file_rt_csv=rt.csv
# grep "plots were eligible for farming" debug.log.1 >> $file_rt_log
cat $file_rt_log | awk -F' ' '{print $1,",",$5,","$13,","$16,","$19}' > $file_rt_csv
cat $file_rt_csv | tr -d " " > tmp.csv
mv tmp.csv $file_rt_csv
# tr -d " " < file_rt_csv > tmp.csv && mv tmp.csv $file_rt_csv
