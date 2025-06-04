#!/bin/bash

# shellcheck disable=SC1091
source ./env.sh
echo "Using LAMBDA_BUCKET: ${LAMBDA_BUCKET}"
echo "Using STACK_NAME: ${STACK_NAME}"
echo "Using STACK_NAME: ${DATA_BUCKET}"

aws s3 rm s3://"${DATA_BUCKET}" --recursive --region us-west-1 --profile iam-profile
aws s3api delete-bucket --bucket "${DATA_BUCKET}" --region us-west-1 --profile iam-profile
if [ $? -ne 0 ]; then
  echo "Failed to delete S3 bucket ${DATA_BUCKET}"
else
  echo "S3 bucket ${DATA_BUCKET} deleted successfully."
fi