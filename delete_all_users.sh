#!/usr/bin/env bash

# AWS_PROFILE=<aws_profile> COGNITO_USER_POOL_ID=<user_pool_id> source delete_all_users.sh

aws cognito-idp list-users --user-pool-id $COGNITO_USER_POOL_ID --profile $AWS_PROFILE |
jq -r '.Users | .[] | .Username' |
while read uname1; do
  echo "Deleting $uname1";
  aws cognito-idp admin-delete-user --user-pool-id $COGNITO_USER_POOL_ID --profile $AWS_PROFILE --username $uname1;
done