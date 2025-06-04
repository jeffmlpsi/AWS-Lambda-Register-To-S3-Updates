#!/bin/bash
# shellcheck disable=SC1091
source ./env.sh
echo "Using LAMBDA_BUCKET: ${LAMBDA_BUCKET}"
echo "Using STACK_NAME: ${STACK_NAME}"

aws cloudformation delete-stack --stack-name ${STACK_NAME} --region us-west-1 --profile iam-profile
if [ $? -ne 0 ]; then
  echo "Failed to delete stack ${STACK_NAME}"
  exit 1
else
  echo "Stack ${STACK_NAME} deletion initiated successfully."
fi
