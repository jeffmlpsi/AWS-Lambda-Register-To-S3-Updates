#!/usr/bin/env bash

# shellcheck disable=SC1091
source ./env.sh

echo "Using LAMBDA_BUCKET: ${LAMBDA_BUCKET}"
echo "Using STACK_NAME: ${STACK_NAME}"
echo "Using STACK_NAME: ${DATA_BUCKET}"

source ./del-data-bucket.sh

aws cloudformation --profile iam-profile package --template-file cfn.yml --s3-bucket "${LAMBDA_BUCKET}" --output-template-file cfn.packaged.yml
if [ $? -ne 0 ]; then
  echo "Failed to package CloudFormation template."
  exit 1
else
  echo "CloudFormation template packaged successfully."
fi
aws cloudformation deploy --profile iam-profile --template-file cfn.packaged.yml --stack-name ${STACK_NAME} --capabilities CAPABILITY_IAM
if [ $? -ne 0 ]; then
  echo "Failed to deploy CloudFormation stack ${STACK_NAME}."
  exit 1
else
  echo "CloudFormation stack ${STACK_NAME} deployed successfully."
fi