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
  vpc_id             = "vpc-02c1deac11ba9ea9b"
  availability_zones = local.production_availability_zones
  repository_name    = "fast-food-app"
  subnets_ids        = ["subnet-04613a554eba04b04", "subnet-06bdc8634d71a49ed"]
  public_subnet_ids  = ["subnet-09ceffff8927fcb98", "subnet-0413a408b0442c8e8"]
  security_groups_ids = [
    "sg-0bd1f3f5df705bd04", "sg-0155be07859999d7e"
  ]
  database_endpoint = "fast-food-database.csxw4cuf3uvj.us-east-1.rds.amazonaws.com"
  database_name     = var.production_database_name
  database_username = var.production_database_username
  database_password = var.production_database_password
}
