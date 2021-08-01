# Sample of processing s3 events with lambda in serverlessframework

## How to use

- Create a docker.env
- Run the following commands

```
$ docker-compose run --rm serverless sh

sh-4.2# bundle config set path "vendor/bundle"
sh-4.2# bundle install
sh-4.2# sls deploy
```

## Processing Step

1. The json file will be uploaded to the s3 "uploads" directory.
2. Lambda function fires on s3 create event.
3. Read the uploaded json file, process it, and delete the target json file from s3.

[Reference](https://zenn.dev/samuraikun/articles/4b5e2becae7c6b)
