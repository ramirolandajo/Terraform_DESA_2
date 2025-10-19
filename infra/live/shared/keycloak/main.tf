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

module "server" {
  source = "../../../modules/server"

  name          = var.name
  ami_id        = var.ami_id
  instance_type = var.instance_type
}
