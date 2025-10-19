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
  environment = "prod"
  module_name = "ecommerce"
}

module "beanstalk" {
  source = "../../../../modules/beanstalk_app"

  project                   = local.project
  environment               = local.environment
  module_name               = local.module_name
  application_name          = var.application_name
  application_description   = var.application_description
  environment_name          = var.environment_name
  environment_description   = var.environment_description
  solution_stack_name       = var.solution_stack_name
  tier                      = var.tier
  cname_prefix              = var.cname_prefix
  version_label             = var.version_label
  version_description       = var.version_description
  version_s3_bucket         = var.version_s3_bucket
  version_s3_key            = var.version_s3_key
  settings                  = var.settings
  tags                      = var.tags
}
