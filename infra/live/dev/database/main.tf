terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

module "database" {
  source = "../../../modules/database"

  identifier        = var.identifier
  db_name           = var.db_name
  username          = var.username
  password          = var.password
  instance_class    = var.instance_class
  engine            = var.engine
  engine_version    = var.engine_version
  allocated_storage = var.allocated_storage
}
