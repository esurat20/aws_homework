output "public_ip" {
  description = "EC2 public ip"
  value       = aws_instance.data_base_instanse.public_ip
}

output "rds_endpoint" {
  description = "RDS endpoint"
  value       = aws_db_instance.characters_postgres.endpoint
}
