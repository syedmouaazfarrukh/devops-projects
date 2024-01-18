variable "region" {
  description = "The AWS region to deploy the infrastructure in."
  type        = string
  default     = "us-east-1"  # Adjust the default region as needed
}


variable "vpc_cidr_block" {
  description = "CIDR block for the VPC."
  default     = "10.0.0.0/16"
}

variable "public_subnet1" {
  description = "CIDR block for the first public subnet."
  default     = "10.0.1.0/24"
}

variable "public_subnet2" {
  description = "CIDR block for the second public subnet."
  default     = "10.0.2.0/24"
}

variable "private_subnet1" {
  description = "CIDR block for the first private subnet."
  default     = "10.0.3.0/24"
}

variable "private_subnet2" {
  description = "CIDR block for the second private subnet."
  default     = "10.0.4.0/24"
}

variable "instance_type" {
  description = "EC2 instance type for the compute module."
  default     = "t2.micro"
}

variable "ami" {
  description = "AMI ID for the compute module."
  default     = "ami-12345678"  # Replace with your desired AMI
}

variable "db_instance_class" {
  description = "DB instance class for the database module."
  default     = "db.t2.micro"
}

variable "db_engine" {
  description = "Database engine for the database module."
  default     = "mysql"
}
