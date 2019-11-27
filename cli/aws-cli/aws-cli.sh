#!/bin/bash -eu
cd $(dirname `realpath $0`)
DOCKER=`which docker`
. aws.env

${DOCKER} run --rm \
    -e "AWS_ACCESS_KEY_ID=${AWS_ACCESS_KEY_ID}" \
    -e "AWS_SECRET_ACCESS_KEY=${AWS_SECRET_ACCESS_KEY}" \
    -e "AWS_DEFAULT_REGION=${AWS_DEFAULT_REGION}" \
    mesosphere/aws-cli ${@}
