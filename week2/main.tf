resource "aws_instance" "s3_instanse" {
  ami = var.ec2_ami_id
  instance_type = var.ec2_instance_type
  security_groups = [aws_security_group.s3-instanse-http-sg.name, aws_security_group.s3-instanse-ssh-sg.name]
  iam_instance_profile = aws_iam_instance_profile.s3_profile.name
  key_name = "DenysTest1"
  user_data = base64encode(file("download_script"))

  tags = {
    Name = "S3-Terraform-Instanse"
  }
}

resource "aws_security_group" "s3-instanse-http-sg" {
  name = "http-sg"
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "s3-instanse-ssh-sg" {
  name = "ssh-sg"
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_iam_role_policy" "s3-full-access-policy" {
  name = "s3-policy"
  role = aws_iam_role.s3-full-access-role.id

  policy = <<-EOF
  {
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "S3FULL",
            "Effect": "Allow",
            "Action": "s3:*",
            "Resource": "*"
        }
    ]
  }
  EOF
}

resource "aws_iam_role" "s3-full-access-role" {
  name = "s3-full-access-role"

  assume_role_policy = <<-EOF
  {
    "Version": "2012-10-17",
    "Statement": [
      {
        "Action": "sts:AssumeRole",
        "Principal": {
          "Service": "ec2.amazonaws.com"
        },
        "Effect": "Allow",
        "Sid": ""
      }
    ]
  }
  EOF
}

resource "aws_iam_instance_profile" "s3_profile" {
  name = "s3_profile"
  role = aws_iam_role.s3-full-access-role.name
}




