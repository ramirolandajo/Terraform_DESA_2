terraform {
  required_version = ">= 1.5.0"

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

locals {
  project     = var.project
  environment = "shared"
  name        = "keycloak"
}

module "server" {
  source = "../../../modules/server"

  project                     = local.project
  environment                 = local.environment
  name                        = local.name
  ami                         = var.ami
  instance_type               = var.instance_type
  subnet_id                   = var.subnet_id
  associate_public_ip_address = var.associate_public_ip_address
  key_name                    = var.key_name
  user_data                   = var.user_data
  iam_instance_profile        = var.iam_instance_profile
  vpc_security_group_ids      = var.vpc_security_group_ids
  create_security_group       = var.create_security_group
  vpc_id                      = var.vpc_id
  security_group_name         = var.security_group_name
  ingress_rules               = var.ingress_rules
  root_block_device           = var.root_block_device
  tags                        = var.tags
}
