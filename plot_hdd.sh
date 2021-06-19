#! /bin/bash

n_serial=10
n_threads=4

mount_point=/mnt
tmp_dir=/xch/tmp
tgt_dir=/xch/plots
log_dir=$HOME/logs/plots
delay=120m


log_file () {
    date_str=$(date --iso-8601=ns)
    date_str=$(echo "$date_str" | sed -r 's/[:]+/_/g')
    date_str=$(echo "$date_str" | sed -r 's/[,]+/\./g')
    echo "$1-"$date_str".log"
}

# mkdir -p $log_dir
for i in disk1 disk2 disk3 disk4 disk5
do
    # mkdir -p $mount_point/$i$tmp_dir
    # mkdir -p $mount_point/$i$tgt_dir
    # logf="$(log_file $i)"
    # nohup chia plots create -k 32 -n $n_serial -r $n_threads -u 128 -b 3389 -t $mount_point/$i$tmp_dir -d $mount_point/$i$tgt_dir > $log_dir/$logf &
    mp=$mount_point/$i
    tmp=$mp$tmp_dir
    tgt=$mp$tgt_dir
    plot_ser.sh $n_serial $n_threads $tmp $tgt $log_dir $i &
    echo "Job $! created - $i"
    sleep $delay
done

