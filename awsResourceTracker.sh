#!/bin/bash

################################
# Author: lordemmag
# Date: 29th March 2025
#
# Version: v1
#
# This script will report the AWS resource usage
###############################

set -e

# AWS S3
# AWS EC2
# AWS Lambda
# AWS IAM Users

# list s3 buckets
echo "Print list of s3 buckets"
aws s3 ls > resourceTracker

# list EC2 instances
echo "Print list of EC2 instances"
aws ec2 describe-instances | jq '.Reservations[].Instances[].InstanceId'

# list lambda
echo "Print list of lambda functions"
aws lambda list-functions >> resourceTracker

# list IAM users
echo "print list of IAM Users"
aws iam list-users


