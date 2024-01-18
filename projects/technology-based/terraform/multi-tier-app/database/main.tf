provider "aws" {
  region = var.region
}

module "database" {
  source        = "./database"
  region        = var.region
  vpc_id        = module.vpc.vpc_id
  db_subnet_ids = module.vpc.private_subnet_ids
}
