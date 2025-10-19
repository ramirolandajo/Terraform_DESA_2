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

module "backend" {
  source = "../../../../modules/beanstalk_app"

  application_name    = var.application_name
  environment_name    = var.environment_name
  solution_stack_name = var.solution_stack_name
  cname_prefix        = var.cname_prefix
  instance_type       = var.instance_type
}
