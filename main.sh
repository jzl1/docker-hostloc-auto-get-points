nohup bash /app/run.sh >/app/app.log 2>&1 &
tail -F /app/app.log
