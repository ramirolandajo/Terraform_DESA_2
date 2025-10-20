terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.92"
    }
  }

  required_version = ">= 1.2"
}

provider "aws" {
  region  = var.region
  profile = "TerraformAdmin"

  assume_role {
    role_arn     = "arn:aws:iam::746207465310:role/TerraformAdminRole"
    session_name = "tf-deploy"
  }
}