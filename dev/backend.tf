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

# --- Data sources: discover default VPC + all its subnets
data "aws_vpc" "default" {
  default = true
}

data "aws_subnets" "default_vpc" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
}

locals {
  subnets_csv = join(",", data.aws_subnets.default_vpc.ids)
}

resource "aws_elastic_beanstalk_environment" "ecommerce-dev-env" {
  name  = "ecommerce-dev-env"  
  application = aws_elastic_beanstalk_application.ecommerce-dev-app.name
  cname_prefix = "ecommerce-dev"
  solution_stack_name = "64bit Amazon Linux 2023 v4.6.6 running Corretto 17"
  tags = {
    Type = "EB Backend"
    Stage = "Dev"
  }
  setting {
    namespace = "aws:ec2:vpc"
    name      = "VPCId"
    value     = data.aws_vpc.default.id
  }
  setting {
    namespace = "aws:ec2:vpc"
    name      = "Subnets"
    value     = local.subnets_csv
  }
  setting {
    namespace = "aws:ec2:instance"
    name      = "InstanceTypes"
    value     = var.backend_instance_type
  }
  dynamic "setting" {
    for_each = var.env_vars
    content {
      namespace = "aws:elasticbeanstalk:application:environment"
      name      = setting.key
      value     = setting.value
    }
  }
}

resource "aws_elastic_beanstalk_application" "ecommerce-dev-app" {
  name = "ecommerce-dev-app"
  tags = {
    Type = "EB Backend"
    Stage = "Dev"
  }

  appversion_lifecycle {
    service_role = "arn:aws:iam::746207465310:role/aws-elasticbeanstalk-service-role"
  }
}