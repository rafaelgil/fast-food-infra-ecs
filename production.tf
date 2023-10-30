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
  vpc_id             = "vpc-0932da4df69a1e2b5"
  availability_zones = local.production_availability_zones
  repository_name    = "fast-food-app"
  subnets_ids        = ["subnet-0b8b700720d03c613", "subnet-05cf28d4e5aff2547"]
  public_subnet_ids  = ["subnet-0d4c9688a70c390b8", "subnet-02cec4a001d01f990"]
  security_groups_ids = [
    "sg-00cc419a06cf9c8de", "sg-081cb7d0daa2a8211"
  ]
  database_endpoint = ""
  database_name     = var.production_database_name
  database_username = var.production_database_username
  database_password = var.production_database_password
}