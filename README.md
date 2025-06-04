# AWS Lambda: Register to S3 updates

This example creates an S3 bucket and a Lambda function.
The Lambda function is configured to be called when a new file is uploaded to S3.

AWS Links: https://docs.aws.amazon.com/AWSCloudFormation/latest/TemplateReference/aws-template-resource-type-ref.html


## Quick Start
Install:
    Node version 20 - Go a web search for installing node. You can use brew on a Mac.
    NOTE: you probably do not actually need to install Node since the Node code will run in  an AWS lambda.

Set Env:
    go into env.sh and:
    set LAMBDA_BUCKET to a unqiue name (recall S3 bucket names must be unique)
    set STACK_NAME to name your Cloud Formation stack. s
Run:
    deploy.sh

    After deploy.sh completes:
        if you do not see any errors, check your stack in the AWS Management Console
        Cloud Formation page to confirm you stack deployed without errors

        Confirm your S3 Bucket exists in the S3 pages in the AWS Management Console

        Confirm your lamabda exists in the Lambda, Function, section of the AWS Management Console

        Run cp2s3.sh to copy a file into your S3 bucket

        From the Lambda pages in the AWS management Console, click in, select monitor, and view the Cloud Watch Logs

    When finshed run: undeploy.sh. NOTE: undeploy.sh does not delete your S3 bucket. You do manually empty and delete
    your S3 bucket

## Stack Details

This stack contains multiple examples of Lambda function declarations using CloudFormation and [SAM](https://github.com/awslabs/serverless-application-model).

### Register for all S3 updates

This example creates an S3 bucket and a Lambda function.
The Lambda function is configured to be called when a new file is uploaded to S3.


