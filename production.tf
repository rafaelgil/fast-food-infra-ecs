/*====
Variables used across all modules
======*/
locals {
  production_availability_zones = ["us-east-1a", "us-east-1b"]
  environment                   = "fast-food"
}

provider "aws" {
  region = var.region
}

module "ecs" {
  source             = "./ecs"
  environment        = local.environment
  vpc_id             = "vpc-07c0309e03c1c0b61"
  availability_zones = local.production_availability_zones
  repository_name    = "fast-food-app"
  subnets_ids        = ["subnet-06f742412121a2c42", "subnet-0bd1ea15b26a2c6d9"]
  public_subnet_ids  = ["subnet-0669d393efec667b6", "subnet-07611e21c22349b2b"]
  security_groups_ids = [
    "sg-0c6296cdd76713cd3", "sg-06191e3cec3a38f00"
  ]
  database_endpoint = "fast-food-database.csxw4cuf3uvj.us-east-1.rds.amazonaws.com"
  database_name     = var.production_database_name
  database_username = var.production_database_username
  database_password = var.production_database_password
}