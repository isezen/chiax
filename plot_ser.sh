#! /bin/bash
#
# EXAMPLE:
#
# Create 10 serial plots with 4 thread
# plot_ser.sh 10 4 $FARMER_KEY $POOL_KEY /mnt/ssd2/chia_tmp /mnt/disk5/chia_plots ~/logs SSD
# NOTE: You need to define your FARMER_KEY and POOL_KEY in your environment for automated plotting.

n_serial=${1:-1}
n_threads=${2:-4}
farmer_key=${3:-"$FARMER_KEY"}
pool_key=${4:-"$POOL_KEY"}
tmp_dir=${5:-"/mnt/ssd2/chia_tmp"}
tgt_dir=${6:-"/mnt/disk5/chia/plots"}
log_dir=${7:-"$HOME/logs/plots"}
log_prefix=${8:-"SSD"}

log_file () {
    date_str=$(date --iso-8601=ns)
    date_str=$(echo "$date_str" | sed -r 's/[:]+/_/g')
    date_str=$(echo "$date_str" | sed -r 's/[,]+/\./g')
    echo "$1-"$date_str".log"
}

mkdir -p $log_dir
mkdir -p $tgt_dir
for i in $( eval echo {1..$n_serial} )
do
    mkdir -p $tmp_dir
    logf="$(log_file $log_prefix)"
    chia plots create -k 32 -b 3389 -n 1 -r $n_threads -f $farmer_key -p $pool_key -t $tmp_dir -d $tgt_dir > $log_dir/$logf 2>&1
done

