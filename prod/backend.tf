/* 

          SUBIDA DE ELASTIC BEANSTALK EN CUENTA 3 DE AWS

 */

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

# ---------------------------
# PATCH: ECOMMERCE -> set CORE_API_URL and KAFKA_MIDDLEWARE_URL
# ---------------------------
resource "null_resource" "patch_ecommerce_prod_envvars" {
  triggers = {
    core_cname       = aws_elastic_beanstalk_environment.core-prod-env.cname
    middleware_cname = aws_elastic_beanstalk_environment.middleware-prod-env.cname
    env_name         = aws_elastic_beanstalk_environment.ecommerce-prod-env.name
  }

  depends_on = [
    aws_elastic_beanstalk_environment.ecommerce-prod-env,
    aws_elastic_beanstalk_environment.core-prod-env,
    aws_elastic_beanstalk_environment.middleware-prod-env
  ]

  provisioner "local-exec" {
    command = "aws elasticbeanstalk update-environment --region sa-east-1 --profile TerraformAdmin3 --environment-name ${aws_elastic_beanstalk_environment.ecommerce-prod-env.name} --option-settings Namespace=aws:elasticbeanstalk:application:environment,OptionName=CORE_API_URL,Value=https://${aws_elastic_beanstalk_environment.core-prod-env.cname} Namespace=aws:elasticbeanstalk:application:environment,OptionName=KAFKA_MIDDLEWARE_URL,Value=https://${aws_elastic_beanstalk_environment.middleware-prod-env.cname}"
  }
}

# ---------------------------
# PATCH: CATALOGUE -> set CORE_API_URL and KAFKA_MIDDLEWARE_URL
# ---------------------------
resource "null_resource" "patch_catalogue_prod_envvars" {
  triggers = {
    core_cname       = aws_elastic_beanstalk_environment.core-prod-env.cname
    middleware_cname = aws_elastic_beanstalk_environment.middleware-prod-env.cname
    env_name         = aws_elastic_beanstalk_environment.catalogue-prod-env.name
  }

  depends_on = [
    aws_elastic_beanstalk_environment.catalogue-prod-env,
    aws_elastic_beanstalk_environment.core-prod-env,
    aws_elastic_beanstalk_environment.middleware-prod-env
  ]

  provisioner "local-exec" {
    command = "aws elasticbeanstalk update-environment --region sa-east-1 --profile TerraformAdmin3 --environment-name ${aws_elastic_beanstalk_environment.catalogue-prod-env.name} --option-settings Namespace=aws:elasticbeanstalk:application:environment,OptionName=CORE_API_URL,Value=https://${aws_elastic_beanstalk_environment.core-prod-env.cname} Namespace=aws:elasticbeanstalk:application:environment,OptionName=KAFKA_MIDDLEWARE_URL,Value=https://${aws_elastic_beanstalk_environment.middleware-prod-env.cname}"
  }
}

# ---------------------------
# PATCH: ANALYTICS -> set CORE_API_URL and KAFKA_MIDDLEWARE_URL
# ---------------------------
resource "null_resource" "patch_analytics_prod_envvars" {
  triggers = {
    core_cname       = aws_elastic_beanstalk_environment.core-prod-env.cname
    middleware_cname = aws_elastic_beanstalk_environment.middleware-prod-env.cname
    env_name         = aws_elastic_beanstalk_environment.analytics-prod-env.name
  }

  depends_on = [
    aws_elastic_beanstalk_environment.analytics-prod-env,
    aws_elastic_beanstalk_environment.core-prod-env,
    aws_elastic_beanstalk_environment.middleware-prod-env
  ]

  provisioner "local-exec" {
    command = "aws elasticbeanstalk update-environment --region sa-east-1 --profile TerraformAdmin3 --environment-name ${aws_elastic_beanstalk_environment.analytics-prod-env.name} --option-settings Namespace=aws:elasticbeanstalk:application:environment,OptionName=CORE_API_URL,Value=https://${aws_elastic_beanstalk_environment.core-prod-env.cname} Namespace=aws:elasticbeanstalk:application:environment,OptionName=KAFKA_MIDDLEWARE_URL,Value=https://${aws_elastic_beanstalk_environment.middleware-prod-env.cname}"
  }
}

# ---------------------------
# PATCH: CORE -> set KAFKA_MIDDLEWARE_URL only
# ---------------------------
resource "null_resource" "patch_core_prod_envvars" {
  triggers = {
    middleware_cname = aws_elastic_beanstalk_environment.middleware-prod-env.cname
    env_name         = aws_elastic_beanstalk_environment.core-prod-env.name
  }

  depends_on = [
    aws_elastic_beanstalk_environment.core-prod-env,
    aws_elastic_beanstalk_environment.middleware-prod-env
  ]

  provisioner "local-exec" {
    command = "aws elasticbeanstalk update-environment --region sa-east-1 --profile TerraformAdmin3 --environment-name ${aws_elastic_beanstalk_environment.core-prod-env.name} --option-settings Namespace=aws:elasticbeanstalk:application:environment,OptionName=KAFKA_MIDDLEWARE_URL,Value=https://${aws_elastic_beanstalk_environment.middleware-prod-env.cname}"
  }
}

# ---------------------------
# PATCH: MIDDLEWARE -> set CORE_API_URL only
# ---------------------------
resource "null_resource" "patch_middleware_prod_envvars" {
  triggers = {
    core_cname = aws_elastic_beanstalk_environment.core-prod-env.cname
    env_name   = aws_elastic_beanstalk_environment.middleware-prod-env.name
  }

  depends_on = [
    aws_elastic_beanstalk_environment.middleware-prod-env,
    aws_elastic_beanstalk_environment.core-prod-env
  ]

  provisioner "local-exec" {
    command = "aws elasticbeanstalk update-environment --region sa-east-1 --profile TerraformAdmin3 --environment-name ${aws_elastic_beanstalk_environment.middleware-prod-env.name} --option-settings Namespace=aws:elasticbeanstalk:application:environment,OptionName=CORE_API_URL,Value=https://${aws_elastic_beanstalk_environment.core-prod-env.cname}"
  }
}

# OUTPUT FOR CLOUDFRONT URLs
output "ecommerce_prod_cname" {
  value = aws_elastic_beanstalk_environment.ecommerce-prod-env.cname
}

output "catalogue_prod_cname" {
  value = aws_elastic_beanstalk_environment.catalogue-prod-env.cname
}

output "core_prod_cname" {
  value = aws_elastic_beanstalk_environment.core-prod-env.cname
}

output "analytics_prod_cname" {
  value = aws_elastic_beanstalk_environment.analytics-prod-env.cname
}
