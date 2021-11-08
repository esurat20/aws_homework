output "public_ip" {
  description = "EC2 public ip"
  value       = aws_instance.s3_instanse.public_ip
}
