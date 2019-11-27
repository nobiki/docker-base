# ams

## Usage

```
$ cd [this directory]

// edit aws.env
$ cp aws.env.example aws.env
$ edit aws.env

// create symbolic link
$ sudo ln -s ${PWD}/aws-cli.sh ~/bin/ams

// run aws-cli on docker
$ ams configure list
      Name                    Value             Type    Location
      ----                    -----             ----    --------
   profile                <not set>             None    None
access_key     ********************              env
secret_key     ********************              env
    region           ap-northeast-1              env    AWS_DEFAULT_REGION
```
