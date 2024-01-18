variable "vpc_cidr_block" {
  description = "CIDR block for the VPC."
}

variable "public_subnet1" {
  description = "CIDR block for the first public subnet."
}

variable "public_subnet2" {
  description = "CIDR block for the second public subnet."
}

variable "private_subnet1" {
  description = "CIDR block for the first private subnet."
}

variable "private_subnet2" {
  description = "CIDR block for the second private subnet."
}
