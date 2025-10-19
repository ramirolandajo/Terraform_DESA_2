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

module "frontend" {
  source = "../../../../modules/frontend"

  bucket_name          = var.bucket_name
  distribution_comment = var.distribution_comment
  default_root_object  = var.default_root_object
}
