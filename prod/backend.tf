/* 

          SUBIDA DE ELASTIC BEANSTALK EN CUENTA 3 DE AWS

 */

# --- Data sources --- 
data "aws_vpc" "default_vpc_3" {
  provider = aws.admin_3
  default = true
}

data "aws_subnets" "default_subnets_3" {
  provider = aws.admin_3
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default_vpc_3.id]
  }
}

locals {
  subnets_csv_3 = join(",", data.aws_subnets.default_subnets_3.ids)
}


// MIDDLEWARE EB BACKEND

resource "aws_elastic_beanstalk_environment" "middleware-prod-env" {
  provider = aws.admin_3
  name  = "middleware-prod-env"  
  application = aws_elastic_beanstalk_application.middleware-prod-app.name
  solution_stack_name = "64bit Amazon Linux 2023 v4.6.6 running Corretto 17"
  tags = {
    Type = "EB Backend"
    Stage = "Prod"
  }
  setting {
    namespace = "aws:ec2:vpc"
    name      = "VPCId"
    value     = data.aws_vpc.default_vpc_3.id
  }
  setting {
    namespace = "aws:ec2:vpc"
    name      = "Subnets"
    value     = local.subnets_csv_3
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
    for_each = var.env_vars_middleware_prod
    content {
      namespace = "aws:elasticbeanstalk:application:environment"
      name      = setting.key
      value     = setting.value
    }
  }
}

resource "aws_elastic_beanstalk_application" "middleware-prod-app" {
  provider = aws.admin_3
  name = "middleware-prod-app"
  tags = {
    Type = "EB Backend"
    Stage = "Prod"
  }

  appversion_lifecycle {
    service_role = "arn:aws:iam::607327612461:role/aws-elasticbeanstalk-service-role"
  }
}

// ECOMMERCE EB BACKEND

resource "aws_elastic_beanstalk_environment" "ecommerce-prod-env" {
  provider = aws.admin_3
  name  = "ecommerce-prod-env"  
  application = aws_elastic_beanstalk_application.ecommerce-prod-app.name
  solution_stack_name = "64bit Amazon Linux 2023 v4.6.6 running Corretto 17"
  tags = {
    Type = "EB Backend"
    Stage = "Prod"
  }
  setting {
    namespace = "aws:ec2:vpc"
    name      = "VPCId"
    value     = data.aws_vpc.default_vpc_3.id
  }
  setting {
    namespace = "aws:ec2:vpc"
    name      = "Subnets"
    value     = local.subnets_csv_3
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
    for_each = var.env_vars_ecommerce_prod
    content {
      namespace = "aws:elasticbeanstalk:application:environment"
      name      = setting.key
      value     = setting.value
    }
  }
}

resource "aws_elastic_beanstalk_application" "ecommerce-prod-app" {
  provider = aws.admin_3
  name = "ecommerce-prod-app"
  tags = {
    Type = "EB Backend"
    Stage = "Prod"
  }

  appversion_lifecycle {
    service_role = "arn:aws:iam::607327612461:role/aws-elasticbeanstalk-service-role"
  }
}

// CATALOGUE EB BACKEND

resource "aws_elastic_beanstalk_environment" "catalogue-prod-env" {
  provider = aws.admin_3
  name  = "catalogue-prod-env"  
  application = aws_elastic_beanstalk_application.catalogue-prod-app.name
  solution_stack_name = "64bit Amazon Linux 2023 v4.6.6 running Corretto 17"
  tags = {
    Type = "EB Backend"
    Stage = "Prod"
  }
  setting {
    namespace = "aws:ec2:vpc"
    name      = "VPCId"
    value     = data.aws_vpc.default_vpc_3.id
  }
  setting {
    namespace = "aws:ec2:vpc"
    name      = "Subnets"
    value     = local.subnets_csv_3
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
    for_each = var.env_vars_catalogue_prod
    content {
      namespace = "aws:elasticbeanstalk:application:environment"
      name      = setting.key
      value     = setting.value
    }
  }
}

resource "aws_elastic_beanstalk_application" "catalogue-prod-app" {
  provider = aws.admin_3
  name = "catalogue-prod-app"
  tags = {
    Type = "EB Backend"
    Stage = "Prod"
  }

  appversion_lifecycle {
    service_role = "arn:aws:iam::607327612461:role/aws-elasticbeanstalk-service-role"
  }
}

// ANALYTICS EB BACKEND

resource "aws_elastic_beanstalk_environment" "analytics-prod-env" {
  provider = aws.admin_3
  name  = "analytics-prod-env"  
  application = aws_elastic_beanstalk_application.analytics-prod-app.name
  solution_stack_name = "64bit Amazon Linux 2023 v4.6.6 running Corretto 17"
  tags = {
    Type = "EB Backend"
    Stage = "Prod"
  }
  setting {
    namespace = "aws:ec2:vpc"
    name      = "VPCId"
    value     = data.aws_vpc.default_vpc_3.id
  }
  setting {
    namespace = "aws:ec2:vpc"
    name      = "Subnets"
    value     = local.subnets_csv_3
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
    for_each = var.env_vars_analytics_prod
    content {
      namespace = "aws:elasticbeanstalk:application:environment"
      name      = setting.key
      value     = setting.value
    }
  }
}

resource "aws_elastic_beanstalk_application" "analytics-prod-app" {
  provider = aws.admin_3
  name = "analytics-prod-app"
  tags = {
    Type = "EB Backend"
    Stage = "Prod"
  }

  appversion_lifecycle {
    service_role = "arn:aws:iam::607327612461:role/aws-elasticbeanstalk-service-role"
  }
}

// CORE EB BACKEND

resource "aws_elastic_beanstalk_environment" "core-prod-env" {
  provider = aws.admin_3
  name  = "core-prod-env"  
  application = aws_elastic_beanstalk_application.core-prod-app.name
  solution_stack_name = "64bit Amazon Linux 2023 v4.6.6 running Corretto 17"
  tags = {
    Type = "EB Backend"
    Stage = "Prod"
  }
  setting {
    namespace = "aws:ec2:vpc"
    name      = "VPCId"
    value     = data.aws_vpc.default_vpc_3.id
  }
  setting {
    namespace = "aws:ec2:vpc"
    name      = "Subnets"
    value     = local.subnets_csv_3
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
    for_each = var.env_vars_core_prod
    content {
      namespace = "aws:elasticbeanstalk:application:environment"
      name      = setting.key
      value     = setting.value
    }
  }
}

resource "aws_elastic_beanstalk_application" "core-prod-app" {
  provider = aws.admin_3
  name = "core-prod-app"
  tags = {
    Type = "EB Backend"
    Stage = "Prod"
  }

  appversion_lifecycle {
    service_role = "arn:aws:iam::607327612461:role/aws-elasticbeanstalk-service-role"
  }
}
