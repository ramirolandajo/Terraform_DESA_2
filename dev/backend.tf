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

/* 

          SUBIDA DE ELASTIC BEANSTALK EN CUENTA 1 DE AWS

 */

# --- Data sources
data "aws_vpc" "default_vpc_1" {
  provider = aws.admin_1
  default = true
}

data "aws_subnets" "default_subnets_1" {
  provider = aws.admin_1
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default_vpc_1.id]
  }
}

locals {
  subnets_csv_1 = join(",", data.aws_subnets.default_subnets_1.ids)
}

resource "aws_elastic_beanstalk_environment" "ecommerce-dev-env" {
  provider = aws.admin_1
  name  = "ecommerce-dev-env"  
  application = aws_elastic_beanstalk_application.ecommerce-dev-app.name
  solution_stack_name = "64bit Amazon Linux 2023 v4.6.6 running Corretto 17"
  tags = {
    Type = "EB Backend"
    Stage = "Dev"
  }
  setting {
    namespace = "aws:ec2:vpc"
    name      = "VPCId"
    value     = data.aws_vpc.default_vpc_1.id
  }
  setting {
    namespace = "aws:ec2:vpc"
    name      = "Subnets"
    value     = local.subnets_csv_1
  }
  setting {
    namespace = "aws:ec2:instances"
    name      = "InstanceTypes"
    value     = var.backend_instance_type
  }
    setting {
    namespace = "aws:elasticbeanstalk:environment"
    name      = "ServiceRole"
    value     = "aws-elasticbeanstalk-service-role"
  }
  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "IamInstanceProfile"
    value     = "aws-elasticbeanstalk-ec2-role"
  }
  setting {
  namespace = "aws:elasticbeanstalk:environment"
  name      = "EnvironmentType"
  value     = "SingleInstance"
  }
  dynamic "setting" {
    for_each = var.env_vars_ecommerce
    content {
      namespace = "aws:elasticbeanstalk:application:environment"
      name      = setting.key
      value     = setting.value
    }
  }
}

resource "aws_elastic_beanstalk_application" "ecommerce-dev-app" {
  provider = aws.admin_1
  name = "ecommerce-dev-app"
  tags = {
    Type = "EB Backend"
    Stage = "Dev"
  }

  appversion_lifecycle {
    service_role = "arn:aws:iam::746207465310:role/aws-elasticbeanstalk-service-role"
  }
}


/* 

          SUBIDA DE ELASTIC BEANSTALK EN CUENTA 2 DE AWS

 */

# --- Data sources
data "aws_vpc" "default_vpc_2" {
  provider = aws.admin_2
  default = true
}

data "aws_subnets" "default_subnets_2" {
  provider = aws.admin_2
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default_vpc_2.id]
  }
}

locals {
  subnets_csv_2 = join(",", data.aws_subnets.default_subnets_2.ids)
}

resource "aws_elastic_beanstalk_environment" "catalogue-dev-env" {
  provider = aws.admin_2
  name  = "catalogue-dev-env"  
  application = aws_elastic_beanstalk_application.catalogue-dev-app.name
  solution_stack_name = "64bit Amazon Linux 2023 v4.6.6 running Corretto 17"
  tags = {
    Type = "EB Backend"
    Stage = "Dev"
  }
  setting {
    namespace = "aws:ec2:vpc"
    name      = "VPCId"
    value     = data.aws_vpc.default_vpc_2.id
  }
  setting {
    namespace = "aws:ec2:vpc"
    name      = "Subnets"
    value     = local.subnets_csv_2
  }
  setting {
    namespace = "aws:ec2:instances"
    name      = "InstanceTypes"
    value     = var.backend_instance_type
  }
  setting {
    namespace = "aws:elasticbeanstalk:environment"
    name      = "ServiceRole"
    value     = "aws-elasticbeanstalk-service-role"
  }
  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "IamInstanceProfile"
    value     = "aws-elasticbeanstalk-ec2-role"
  }
  setting {
    namespace = "aws:elasticbeanstalk:environment"
    name      = "EnvironmentType"
    value     = "SingleInstance"
  }
  dynamic "setting" {
    for_each = var.env_vars_ecommerce
    content {
      namespace = "aws:elasticbeanstalk:application:environment"
      name      = setting.key
      value     = setting.value
    }
  }
}

resource "aws_elastic_beanstalk_application" "catalogue-dev-app" {
  provider = aws.admin_2
  name = "catalogue-dev-app"
  tags = {
    Type = "EB Backend"
    Stage = "Dev"
  }

  appversion_lifecycle {
    service_role = "arn:aws:iam::426333730924:role/aws-elasticbeanstalk-service-role"
  }
}