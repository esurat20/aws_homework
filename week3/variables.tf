variable "AWS_ACCESS_KEY" {}

variable "AWS_SECRET_KEY" {}

variable "AWS_REGION" {
  description = "AWS region"
  type        = string
  default     = "us-west-2"
}

variable "ec2_ami_id" {
  description = "Operation system id"
  type        = string
  default     = "ami-013a129d325529d4d"
}

variable "ec2_instance_type" {
  description = "Instance type for EC2"
  type        = string
  default     = "t2.micro"
}
