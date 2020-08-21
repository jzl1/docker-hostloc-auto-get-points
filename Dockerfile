FROM python:3.7.9-slim-stretch
RUN mkdir /app
WORKDIR /app
ONBUILD ADD . /app
RUN apt-get update -y \
    && apt-get install wget cron -y --no-install-recommends \
	&& pip install requests \
    && wget https://raw.githubusercontent.com/xirikm/hostloc-auto-get-points/master/hostloc_get_points.py \
	&& wget https://raw.githubusercontent.com/jzl1/docker-hostloc-auto-get-points/master/run.sh \
    && chmod +x run.sh \
    && touch ./cron \
	&& touch /app/cron.log \
    && echo "*/180 * * * * root python3 hostloc_get_points.py >> /app/cron.log" >> /app/cron \
    && crontab /app/cron \
	&& cp /app/cron /etc/crontab \
	&& rm -rf /var/lib/apt/lists/* \
CMD  ["bash","/app/run.sh"]