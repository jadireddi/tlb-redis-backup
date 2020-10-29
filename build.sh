#!/bin/bash

IMAGE_TAG="conviva/redis-backup"

# Crete the build directory
rm -rf build
mkdir build

cp start_redis.sh build/
cp cron_backups.sh build/
cp backup.sh build/
cp Dockerfile build/

docker build -t="${IMAGE_TAG}" build/

rm -rf build
