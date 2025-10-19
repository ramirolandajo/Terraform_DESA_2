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
  environment = "dev"
  module_name = "analytics"
}

module "frontend" {
  source = "../../../../modules/frontend"

  project             = local.project
  environment         = local.environment
  module_name         = local.module_name
  bucket_name         = var.bucket_name
  aliases             = var.aliases
  certificate_arn     = var.certificate_arn
  default_root_object = var.default_root_object
  tags                = var.tags
}
