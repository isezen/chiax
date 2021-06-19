#! /bin/bash


while :
do
  FILE="stop_free_mem"
  if test -f "$FILE"; then
    break
  fi
  sysctl -w vm.drop_caches=3
  swapoff -a
  swapon -a
  sleep 30m
done

