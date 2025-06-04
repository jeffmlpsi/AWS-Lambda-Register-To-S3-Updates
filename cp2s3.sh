#!/bin/bash
# shellcheck disable=SC1091
source ./env.sh

rnd=$RANDOM
destFileName="README${rnd}.md"
aws s3 cp README.md s3://"${DATA_BUCKET}"/"${destFileName}" --region us-west-1 --profile iam-profile
if [ $? -ne 0 ]; then
    echo "Failed to upload ${destFileName} to S3 bucket $DATA_BUCKET"
    exit 1
else
    echo "Successfully uploaded ${destFileName} to S3 bucket $DATA_BUCKET"
fi
