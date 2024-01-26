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
  vpc_id             = "vpc-0fe5292222d495854"
  availability_zones = local.production_availability_zones
  repository_name    = "fast-food-app"
  subnets_ids        = ["subnet-07cfdc74862fb5a39", "subnet-0d7c3c1a48777ce60"]
  public_subnet_ids  = ["subnet-0088189c9342626bc", "subnet-0a210ec2d8158cc25"]
  security_groups_ids = [
    "sg-058d9aea3f43b735f", "sg-0514cbb401560b035"
  ]
}
