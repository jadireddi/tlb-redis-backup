FROM phusion/baseimage:0.10.1
MAINTAINER  conviva

# Set up the environment
#
ENV DEBIAN_FRONTEND noninteractive


# Install build deps
#
RUN apt-get update && apt-get -y -q install \
	build-essential tcl8.5 wget awscli dnsutils && \
	apt-get clean && rm -rf /var/lib/apt/lists/*

# Create Redis user and data directory structure
#
RUN useradd redis
ENV REDIS_DATA_DIR /var/lib/redis
ENV REDIS_LOG_DIR /var/log/redis
ENV REDIS_PID_DIR /var/run/redis
RUN \
	mkdir -p $REDIS_LOG_DIR && \
	mkdir -p $REDIS_DATA_DIR && \
	mkdir -p $REDIS_PID_DIR && \
	chown redis:redis $REDIS_DATA_DIR && \
	chown redis:redis $REDIS_LOG_DIR && \
	chown redis:redis $REDIS_PID_DIR


# Set entry point for my_init and add backup scripts
#
RUN mkdir /etc/service/redis
COPY start_redis.sh /etc/service/redis/run
COPY backup.sh /backup.sh
COPY cron_backups.sh /cron_backups.sh



# Use baseimage-docker's init system.
#
CMD ["/sbin/my_init"]
