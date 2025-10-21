terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.17.0"
    }
  }
  
  required_version = ">= 1.2"
}

provider "aws" {
  alias   = "admin_1"
  region  = var.region
  profile = "TerraformAdmin"

  assume_role {
    role_arn     = "arn:aws:iam::746207465310:role/TerraformAdminRole"
    session_name = "tf-deploy"
  }
}

provider "aws" {
  alias   = "admin_2"
  region  = var.region
  profile = "TerraformAdmin2"

  assume_role {
    role_arn     = "arn:aws:iam::426333730924:role/TerraformAdmin2"
    session_name = "tf-deploy2"
  }
}

