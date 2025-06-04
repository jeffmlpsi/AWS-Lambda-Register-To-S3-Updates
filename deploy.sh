#!/usr/bin/env bash

# shellcheck disable=SC1091
source ./env.sh

echo "Using LAMBDA_BUCKET: ${LAMBDA_BUCKET}"
echo "Using STACK_NAME: ${STACK_NAME}"
aws s3api head-bucket --bucket "${LAMBDA_BUCKET}" 2>/dev/null
if [ $? -ne 0 ]; then
    echo "Creating S3 bucket ${LAMBDA_BUCKET}..."
    aws s3 mb "s3://${LAMBDA_BUCKET}" --region us-west-1 --profile iam-profile  
else
    echo "S3 bucket ${LAMBDA_BUCKET} already exists."
fi



aws cloudformation --profile iam-profile package --template-file cfn.yml --s3-bucket ${LAMBDA_BUCKET} --output-template-file cfn.packaged.yml
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