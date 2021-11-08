#!/bin/bash
sudo su
aws s3 cp s3://denys-s3-full-access-bucket/s3-file.txt /home/ec2-user
