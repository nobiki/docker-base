# ams

## Setup

```
$ git clone https://github.com/nobiki/docker-base
$ cd docker-base/cli/aws-cli

// edit aws.env
$ cp aws.env.example aws.env
$ edit aws.env

// create symbolic link
$ sudo ln -s ${PWD}/aws-cli.sh ~/bin/ams
```

## Usage

```
// run aws-cli on docker
$ ams configure list
      Name                    Value             Type    Location
      ----                    -----             ----    --------
   profile                <not set>             None    None
access_key     ********************              env
secret_key     ********************              env
    region           ap-northeast-1              env    AWS_DEFAULT_REGION
```
