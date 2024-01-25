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
  vpc_id             = "vpc-07a59b130204263c2"
  availability_zones = local.production_availability_zones
  repository_name    = "fast-food-app"
  subnets_ids        = ["subnet-07feb062c5ccf071c", "subnet-0420b3c2c14b17c36"]
  public_subnet_ids  = ["subnet-08632d4df64e4707f", "subnet-0b3fe5e6cc1a9a399"]
  security_groups_ids = [
    "sg-029841ea9f1cbd5cc", "sg-096d47a11c782e97a"
  ]
}
