aws dynamodb list-tables --region us-west-2
aws dynamodb put-item --table-name characters --region us-west-2 --item '{"Id": {"N": "0"}, "Name": {"S": "Loki"}}'
aws dynamodb put-item --table-name characters --region us-west-2 --item '{"Id": {"N": "1"}, "Name": {"S": "Jane Foster"}}'
aws dynamodb scan --table-name characters --region us-west-2
