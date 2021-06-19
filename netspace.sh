#!/bin/bash
#
# Save estimated chia network space

log_file=~/logs/chia_netspace.log
FILE="~/stop_netspace"
exit_loop=0

# echo "date, EiB" >> $log_file
while [ $exit_loop -lt 1 ];
do
    ns=$(chia netspace | grep "EiB" | awk {'print $6'})
    echo $(date '+%Y-%m-%d %H:%M:%S'), ${ns} >> $log_file
    for i in {1..12} ; do
        if test -f "$FILE"; then
            rm $FILE
            exit_loop=1
            break
        fi
        # echo $i
        sleep 5m
    done
done

exit 0
