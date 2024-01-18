provider "aws" {
  region = var.region
}

module "network" {
  source       = "./network"
  vpc_cidr_block  = "10.0.0.0/16"
  public_subnet1  = "10.0.1.0/24"
  public_subnet2  = "10.0.2.0/24"
  private_subnet1 = "10.0.3.0/24"
  private_subnet2 = "10.0.4.0/24"
}

module "compute" {
  source           = "./compute"
  instance_type    = "t2.micro"
  ami              = "ami-12345678"  # Replace with your desired AMI
  vpc_id           = module.network.vpc_cidr_block
  public_subnet_ids = [module.network.public_subnet1, module.network.public_subnet2]
}

module "database" {
  source            = "./database"
  db_instance_class = "db.t2.micro"
  db_engine         = "mysql"
  vpc_id            = module.network.vpc_id
  private_subnet_ids = [module.network.private_subnet1, module.network.private_subnet2]
}




# ... provider configuration

module "vpc" {
  source = "./vpc"  # Path to the VPC module
}

resource "aws_instance" "my_ec2_instance" {
  ami           = var.ami
  instance_type = var.instance_type
  vpc_id        = module.vpc.vpc_id
  subnet_id     = module.vpc.public_subnet.id  # Assuming you want to use the public subnet

  # ... other instance configuration
}
