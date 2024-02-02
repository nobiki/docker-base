# lambda-base

## build image

```
docker compose build
```

If you get the error => `ERROR [internal] load metadata for public.ecr.aws/lambda/python:3.9` do the following:

```
docker logout public.ecr.aws
```

## push ECR

```
docker tag [IMAGE_NAME]:latest [AWS_ACCOUNT_ID].dkr.ecr.[AWS_REGION].amazonaws.com/[IMAGE_NAME]:latest
aws ecr get-login-password | docker login --username AWS --password-stdin [AWS_ACCOUNT_ID].dkr.ecr.[AWS_REGION].amazonaws.com
docker push [AWS_ACCOUNT_ID].dkr.ecr.[AWS_REGION].amazonaws.com/[IMAGE_NAME]
```

## local debug

```
docker compose up -d
```

```
curl http://127.0.0.1:9000/2015-03-31/functions/function/invocations -s -d '{"hoge":"moge"}'
```

