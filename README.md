# Docker Redis-backup

To backup the redis dump file to AWS S3.


## Building the image

Clone the repository

  	./build

## Backups

This image has the ability to upload backups to AWS s3 using a cron schedule. To
use this, you need to set the following environment variables:

  * `CRON_TIME` = Cron time schedule. Example: `*/15 * * * *`
  * `S3_BUCKET` = relative s3 bucket path. Example: `bucket/folder1/.../folderN`
  * `AWS_ACCESS_KEY_ID` = Your aws access key id
  * `AWS_SECRET_ACCESS_KEY` = Your aws secret key
  * `AWS_DEFAULT_REGION` = The aws default region. Example: `us-east-1`
  * `REDIS_DB` = This is optional. Only set it if you have overridden the
  default database file name (dump.rdb)
  
## Running

```
docker run \
-e CRON_TIME='*/1 * * * *' \
-e S3_BUCKET='tlb-repo/dev/legacy/Train_2_181/' \
-e AWS_ACCESS_KEY_ID='*******' \
-e AWS_SECRET_ACCESS_KEY='******' \
-e AWS_DEFAULT_REGION='us-east-1' \
conviva/redis-backup:latest
```  


