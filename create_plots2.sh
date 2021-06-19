#! /bin/bash

n_par=3
n_serial=4
n_threads=4

tmp_dir=/mnt/ssd2/chia_tmp
tgt_dir=/mnt/disk5/chia_plots
log_dir=/home/isezen/logs
delay=0


# watch ssd and cpu
./watch_sys.sh &

mkdir -p $log_dir
mkdir -p $tgt
for i in {1..3}
do
   mkdir -p "$tmp$i"
   chia plots create -k 32 -b 4000 -n $n_serial -r $n_threads -t $tmp_dir$i -d $tgt_dir > $log_dir/plot_job$i.log &
   echo "$i- Job $! created"
   sleep $delay
done

