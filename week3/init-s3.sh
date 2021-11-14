#!/bin/bash
aws s3 mb s3://denys-s3-full-access-database-bucket --region us-west-2
aws s3api put-bucket-versioning --bucket denys-s3-full-access-database-bucket --versioning-configuration Status=Enabled
aws s3 cp dynamo-db-script.sh s3://denys-s3-full-access-database-bucket
aws s3 cp rds-script.sql s3://denys-s3-full-access-database-bucket
