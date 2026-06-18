terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "ap-southeast-1" # Singapore region (closest to Malaysia)
}

# 1. Create a Security Group for Flask & SSH
resource "aws_security_group" "flask_lab_sg" {
  name        = "flask-lab-sg"
  description = "Allow SSH and Flask web traffic"

  # SSH Access
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # In production, restrict this to your IP
  }

  # Flask App Access
  ingress {
    from_port   = 5000
    to_port     = 5000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Allows anyone to view your web app
  }

  # Outbound Traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# 2. Provision EC2 Instance with Docker Pre-installed
resource "aws_instance" "flask_server" {
  ami           = "ami-060e277c0d4cce553" # Ubuntu 24.04 LTS LTS in Singapore
  instance_type = "t2.micro"
  key_name      = "postgres-lab-key" # Reusing your existing key pair

  vpc_security_group_ids = [aws_security_group.flask_lab_sg.id]

  # User data script to automate Docker installation on startup
  user_data = <<-EOF
              #!/bin/bash
              sudo apt-get update -y
              sudo apt-get install -y docker.io
              sudo systemctl start docker
              sudo systemctl enable docker
              sudo usermod -aG docker ubuntu
              EOF

  tags = {
    Name = "Docker-Flask-Lab-Server"
  }
}

# 3. Output the New IP Address automatically
output "ec2_public_ip" {
  value       = aws_instance.flask_server.public_ip
  description = "The public IP address of the new Flask server"
}