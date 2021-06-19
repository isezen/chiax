#! /bin/bash

n_serial=2
n_threads=4

mount_point=/mnt
tmp_dir=$mount_point/ssd2/chia_tmp
tgt_dir=/chia/plots
log_dir=$HOME/logs/plots
delay=30m


log_file () {
    date_str=$(date --iso-8601=ns)
    date_str=$(echo "$date_str" | sed -r 's/[:]+/_/g')
    date_str=$(echo "$date_str" | sed -r 's/[,]+/\./g')
    echo "$1-"$date_str".log"
}

# mkdir -p $log_dir
# mkdir -p $tmp_dir

# for each target disc
for i in disk5 disk5
do
    tgt=$mount_point/$i$tgt_dir
    # mkdir -p $tgt
    # logf="$(log_file ssd)"
    # nohup chia plots create -k 32 -n $n_serial -r $n_threads -u 128 -b 3389 -t $tmp_dir -d $tgt > $log_dir/$logf &
    plot_ser.sh $n_serial $n_threads $tmp_dir $tgt $log_dir "ssd" &
    echo "Job $! created - $i"
    sleep $delay
done
