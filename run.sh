#!/bin/bash
python3 hostloc_get_points.py
set i=2
while true
do
let "i=i+1"
python3 hostloc_get_points.py
sleep 3h
done
