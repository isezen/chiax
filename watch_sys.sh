#!/bin/sh

while :
do
  FILE="stop_watch"
  if test -f "$FILE"; then
    break
  fi
  hdd=$(df -P -BG | grep '/dev/nvme1n1p1' | awk {'print $3'})
  cpu=$(cat /proc/loadavg | awk '{print $1", "$2", "$3}')
  echo $(date '+%Y-%m-%d %H:%M:%S'), ${hdd%G}, ${cpu} >> watch.log
  sleep 5m
done
