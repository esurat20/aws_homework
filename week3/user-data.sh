#!/bin/bash
sudo su
aws s3 cp s3://denys-s3-full-access-database-bucket/dynamo-db-script.sh /home/ec2-user
aws s3 cp s3://denys-s3-full-access-database-bucket/rds-script.sql /home/ec2-user

sudo yum update -y
sudo amazon-linux-extras enable postgresql12 -y
sudo yum install postgresql postgresql-devel -y
