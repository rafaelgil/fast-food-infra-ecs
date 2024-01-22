variable "environment" {
  description = "The environment"
}

variable "vpc_id" {
  description = "The VPC id"
}

variable "availability_zones" {
  description = "The azs to use"
}

variable "security_groups_ids" {
  description = "The SGs to use"
}

variable "subnets_ids" {
  description = "The private subnets to use"
}

variable "public_subnet_ids" {
  description = "The public subnets to use"
}

variable "repository_name" {
  description = "repository name"
  default = "fast-food-app"
}

variable "repository_name_pagamento" {
  description = "repository name"
  default = "fast-food-app-pagamento"
}

variable "database_endpoint" {
  description = "The database endpoint"
}

variable "database_username" {
  description = "The database username"
  default = "postgres"
}

variable "database_password" {
  description = "The database password"
  default = "Postgres2023"
}

variable "database_name" {
  description = "The database that the app will use"
  default = "food"
}

variable "mongo_url" {
  description = "The database url"
  default = "mongodb://fast_food_pagamento_admin:fast_food_pagamento_root@fast-food-docdb-cluster.cluster-csxw4cuf3uvj.us-east-1.docdb.amazonaws.com:27017/?tls=true&tlsCAFile=global-bundle.pem&replicaSet=rs0&readPreference=secondaryPreferred&retryWrites=false"
}

variable "mongo_username" {
  description = "The database username"
  default = "fast_food_pagamento_admin"
}

variable "mongo_password" {
  description = "The database password"
  default = "fast_food_pagamento_root"
}

variable "url_sqs" {
  description = "SQS URL"
  default = "https://sqs.us-east-1.amazonaws.com/372431383879"
}