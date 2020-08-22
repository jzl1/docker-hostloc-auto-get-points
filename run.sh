#!/bin/bash
tail -F /app/cron.log
set i=2
while true
do
let "i=i+1"
python3 hostloc_get_points.py >> /app/app.log
sleep 3h
done
