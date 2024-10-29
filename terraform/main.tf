provider "aws" {
  region = "us-east-2"
}

# variable for my IP
variable "my_ip" {
  type        = string
  description = "Tu dirección IP privada"
}

# security group config
resource "aws_security_group" "allow_ssh" {
  name        = "instance_connect"
  description = "Allow only traffic from Instance connect's IP from us-east-2"

  ingress {
    description = "EC2 Instance connect for us-east-2"
    from_port   = 22
    to_port     = 22
    protocol    = "ssh"
    cidr_blocks = ["3.16.146.0/29"]
  }

  ingress {
    description = "Allow port   
 8080 from your IP"
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["${var.my_ip}/32"]
  }

  ingress {
    description = "Allow port 3000 from your IP"
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = ["${var.my_ip}/32"]
  }
}

# EC2 Instance config
resource "aws_instance" "example" {
  ami           = "ami-085f9c64a9b75eed5" 
  instance_type = "t2.micro"

  tags = {
    Name = "test-from-jenkins"
  }

  vpc_security_group_ids = [aws_security_group.instance_connect.id]

  user_data = <<EOF
#!/bin/bash
sudo apt update
sudo apt upgrade -y
sudo apt install docker.io -y
EOF
}