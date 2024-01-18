provider "aws" {
  region = var.region
}

module "vpc" {
  source = "../network"  # Path to the VPC module
}

resource "aws_instance" "multi-tier-app-ec2" {
  ami           = var.ami
  instance_type = var.instance_type
  vpc_id        = module.vpc.vpc_id
  subnet_id     = module.vpc.public_subnet_id  # Assuming you want to use the public subnet
  tags = {
    Name = "My EC2 Instance"
  }
}

