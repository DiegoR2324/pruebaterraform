provider "aws" {
  region  = "us-east-1"
}

resource "aws_vpc" "practico-terraform-vpc" {
  cidr_block           = 172.16.0.0/16
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "test-terraform-vpc"
  }
}
resource "aws_security_group" "practico-terraform-sg" {
  name        = "practico-terraform-sg"
  description = "Allow ssh"
  vpc_id      = "practico-terraform-vpc"

  tags = {
    Name = "practico-terraform-sg"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_tls_ipv4" {
  security_group_id = "practico-terraform-sg"
  cidr_ipv4         = 172.16.0.0/16
  from_port         = 22
  ip_protocol       = "tcp ssh"
  to_port           = 22
}

resource "aws_instance" "prueba-despliegue-ec2" {
  ami                    = "ami-08c07ff60ef32087d"
  instance_type          = "t2.micro"
  key_name               = "vockey"
  tags = {
    Name      = "despliegue-terraform"
  }
}

