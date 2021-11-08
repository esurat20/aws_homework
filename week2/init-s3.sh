#shell
echo "File for s3" > s3-file.txt
aws s3 mb s3://denys-s3-full-access-bucket --region us-west-2
aws s3api put-bucket-versioning --bucket denys-s3-full-access-bucket --versioning-configuration Status=Enabled
aws s3 cp s3-file.txt s3://denys-s3-full-access-bucket
