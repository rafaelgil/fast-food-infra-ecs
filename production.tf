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
  vpc_id             = "vpc-0f82249b93e7a254c"
  availability_zones = local.production_availability_zones
  repository_name    = "fast-food-app"
  subnets_ids        = ["subnet-065449805451caff0", "subnet-091e01762f5d9aff3"]
  public_subnet_ids  = ["subnet-08f40ccbea8b6fee9", "subnet-01c89856ab8dcd0d0"]
  security_groups_ids = [
    "sg-08815d5adcf3e997d", "sg-0a71737174343b45a"
  ]
}
