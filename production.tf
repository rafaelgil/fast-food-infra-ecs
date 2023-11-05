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
  vpc_id             = "vpc-0a2cba44022ac9eaa"
  availability_zones = local.production_availability_zones
  repository_name    = "fast-food-app"
  subnets_ids        = ["subnet-054f3041d61eb3975", "subnet-03da4468b1b6b1571"]
  public_subnet_ids  = ["subnet-0d1d0a58cae126f0e", "subnet-02cc5f0f6712ac5a4"]
  security_groups_ids = [
    "sg-053c01e4429ae9f68", "sg-005118b90b347b55a"
  ]
  database_endpoint = "fast-food-database.csxw4cuf3uvj.us-east-1.rds.amazonaws.com"
  database_name     = var.production_database_name
  database_username = var.production_database_username
  database_password = var.production_database_password
}
