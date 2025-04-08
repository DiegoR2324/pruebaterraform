provider "aws" {
  region  = "us-east-1"
}
resource "aws_instance" "prueba-despliegue-ec2" {
  ami                    = "ami-08c07ff60ef32087d"
  instance_type          = "t2.micro"
  key_name               = "vockey"
  tags = {
    Name      = "despliegue-terraform"
  }
}

