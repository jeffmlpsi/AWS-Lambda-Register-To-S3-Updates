#!/bin/bash
# shellcheck disable=SC1091
source ./env.sh

aws s3 rm s3://ucsc-devops-lamdba-s3/README.md --region us-west-1 --profile iam-profile

aws s3 cp README.md s3://"${LAMBDA_BUCKET}"/README5.md --region us-west-1 --profile iam-profile
if [ $? -ne 0 ]; then
    echo "Failed to upload README.md to S3 bucket $LAMBDA_BUCKET"
    exit 1
else
    echo "Successfully uploaded README.md to S3 bucket $LAMBDA_BUCKET"
fi
