provider "aws" {
  region = variable.region
}

module "vpc" {
  source          = "./network"
  region          = var.region
  vpc_cidr_block  = "10.0.0.0/16"
  public_subnet1  = "10.0.1.0/24"
  public_subnet2  = "10.0.2.0/24"
  private_subnet1 = "10.0.3.0/24"
  private_subnet2 = "10.0.4.0/24"
}




resource "aws_vpc" "multi-tier-vpc" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "multi-tierpublic_subnet" {
  vpc_id     = aws_vpc.multi-tier-vpc.id
  cidr_block = "10.0.1.0/24"
}

# ... other subnet resources as needed
