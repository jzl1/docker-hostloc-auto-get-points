FROM python:3.7.9-slim-stretch
RUN mkdir /app
WORKDIR /app
ONBUILD ADD . /app
RUN apt-get update -y \
    && apt-get install wget cron -y --no-install-recommends \
	&& pip install requests \
    && wget https://raw.githubusercontent.com/xirikm/hostloc-auto-get-points/master/hostloc_get_points.py \
	&& wget https://raw.githubusercontent.com/jzl1/docker-hostloc-auto-get-points/master/run.sh \
	&& wget https://raw.githubusercontent.com/jzl1/docker-hostloc-auto-get-points/master/main.sh \
    && chmod +x *.sh \
    && touch ./cron \
	&& touch /app/app.log \
	&& rm -rf /var/lib/apt/lists/* \
CMD ["bash","/app/main.sh"]
