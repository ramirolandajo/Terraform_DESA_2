locals {
  subnets_csv_2 = join(",", data.aws_subnets.default_subnets_2.ids)
}

// MIDDLEWARE EB BACKEND

resource "aws_elastic_beanstalk_environment" "middleware-dev-env" {
  provider = aws.admin_2
  name  = "middleware-dev-env"  
  application = aws_elastic_beanstalk_application.middleware-dev-app.name
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
    for_each = var.env_vars_middleware_dev
    content {
      namespace = "aws:elasticbeanstalk:application:environment"
      name      = setting.key
      value     = setting.value
    }
  }
}

resource "aws_elastic_beanstalk_application" "middleware-dev-app" {
  provider = aws.admin_2
  name = "middleware-dev-app"
  tags = {
    Type = "EB Backend"
    Stage = "Dev"
  }

  appversion_lifecycle {
    service_role = "arn:aws:iam::426333730924:role/aws-elasticbeanstalk-service-role"
  }
}

// ECOMMERCE EB BACKEND

resource "aws_elastic_beanstalk_environment" "ecommerce-dev-env" {
  provider = aws.admin_2
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
    for_each = var.env_vars_ecommerce_dev
    content {
      namespace = "aws:elasticbeanstalk:application:environment"
      name      = setting.key
      value     = setting.value
    }
  }
}

resource "aws_elastic_beanstalk_application" "ecommerce-dev-app" {
  provider = aws.admin_2
  name = "ecommerce-dev-app"
  tags = {
    Type = "EB Backend"
    Stage = "Dev"
  }

  appversion_lifecycle {
    service_role = "arn:aws:iam::426333730924:role/aws-elasticbeanstalk-service-role"
  }
}

// CATALOGUE EB BACKEND

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
    for_each = var.env_vars_catalogue_dev
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

// ANALYTICS EB BACKEND

resource "aws_elastic_beanstalk_environment" "analytics-dev-env" {
  provider = aws.admin_2
  name  = "analytics-dev-env"  
  application = aws_elastic_beanstalk_application.analytics-dev-app.name
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
    for_each = var.env_vars_analytics_dev
    content {
      namespace = "aws:elasticbeanstalk:application:environment"
      name      = setting.key
      value     = setting.value
    }
  }
}

resource "aws_elastic_beanstalk_application" "analytics-dev-app" {
  provider = aws.admin_2
  name = "analytics-dev-app"
  tags = {
    Type = "EB Backend"
    Stage = "Dev"
  }

  appversion_lifecycle {
    service_role = "arn:aws:iam::426333730924:role/aws-elasticbeanstalk-service-role"
  }
}

// CORE EB BACKEND

resource "aws_elastic_beanstalk_environment" "core-dev-env" {
  provider = aws.admin_2
  name  = "core-dev-env"  
  application = aws_elastic_beanstalk_application.core-dev-app.name
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
    for_each = var.env_vars_core_dev
    content {
      namespace = "aws:elasticbeanstalk:application:environment"
      name      = setting.key
      value     = setting.value
    }
  }
}

resource "aws_elastic_beanstalk_application" "core-dev-app" {
  provider = aws.admin_2
  name = "core-dev-app"
  tags = {
    Type = "EB Backend"
    Stage = "Dev"
  }

  appversion_lifecycle {
    service_role = "arn:aws:iam::426333730924:role/aws-elasticbeanstalk-service-role"
  }
}

# ---------------------------
# PATCH: ECOMMERCE (DEV) -> set CORE_API_URL and KAFKA_MIDDLEWARE_URL
# ---------------------------
resource "null_resource" "patch_ecommerce_dev_envvars" {
  triggers = {
    core_cname       = aws_elastic_beanstalk_environment.core-dev-env.cname
    middleware_cname = aws_elastic_beanstalk_environment.middleware-dev-env.cname
    env_name         = aws_elastic_beanstalk_environment.ecommerce-dev-env.name
  }

  depends_on = [
    aws_elastic_beanstalk_environment.ecommerce-dev-env,
    aws_elastic_beanstalk_environment.core-dev-env,
    aws_elastic_beanstalk_environment.middleware-dev-env
  ]

  provisioner "local-exec" {
    command = <<EOT
aws elasticbeanstalk update-environment \
  --environment-name ${aws_elastic_beanstalk_environment.ecommerce-dev-env.name} \
  --option-settings \
Namespace=aws:elasticbeanstalk:application:environment,OptionName=CORE_API_URL,Value=https://${aws_elastic_beanstalk_environment.core-dev-env.cname} \
Namespace=aws:elasticbeanstalk:application:environment,OptionName=KAFKA_MIDDLEWARE_URL,Value=https://${aws_elastic_beanstalk_environment.middleware-dev-env.cname}
EOT
  }
}

# ---------------------------
# PATCH: CATALOGUE (DEV) -> set CORE_API_URL and KAFKA_MIDDLEWARE_URL
# ---------------------------
resource "null_resource" "patch_catalogue_dev_envvars" {
  triggers = {
    core_cname       = aws_elastic_beanstalk_environment.core-dev-env.cname
    middleware_cname = aws_elastic_beanstalk_environment.middleware-dev-env.cname
    env_name         = aws_elastic_beanstalk_environment.catalogue-dev-env.name
  }

  depends_on = [
    aws_elastic_beanstalk_environment.catalogue-dev-env,
    aws_elastic_beanstalk_environment.core-dev-env,
    aws_elastic_beanstalk_environment.middleware-dev-env
  ]

  provisioner "local-exec" {
    command = <<EOT
aws elasticbeanstalk update-environment \
  --environment-name ${aws_elastic_beanstalk_environment.catalogue-dev-env.name} \
  --option-settings \
Namespace=aws:elasticbeanstalk:application:environment,OptionName=CORE_API_URL,Value=https://${aws_elastic_beanstalk_environment.core-dev-env.cname} \
Namespace=aws:elasticbeanstalk:application:environment,OptionName=KAFKA_MIDDLEWARE_URL,Value=https://${aws_elastic_beanstalk_environment.middleware-dev-env.cname}
EOT
  }
}

# ---------------------------
# PATCH: ANALYTICS (DEV) -> set CORE_API_URL and KAFKA_MIDDLEWARE_URL
# ---------------------------
resource "null_resource" "patch_analytics_dev_envvars" {
  triggers = {
    core_cname       = aws_elastic_beanstalk_environment.core-dev-env.cname
    middleware_cname = aws_elastic_beanstalk_environment.middleware-dev-env.cname
    env_name         = aws_elastic_beanstalk_environment.analytics-dev-env.name
  }

  depends_on = [
    aws_elastic_beanstalk_environment.analytics-dev-env,
    aws_elastic_beanstalk_environment.core-dev-env,
    aws_elastic_beanstalk_environment.middleware-dev-env
  ]

  provisioner "local-exec" {
    command = <<EOT
aws elasticbeanstalk update-environment \
  --environment-name ${aws_elastic_beanstalk_environment.analytics-dev-env.name} \
  --option-settings \
Namespace=aws:elasticbeanstalk:application:environment,OptionName=CORE_API_URL,Value=https://${aws_elastic_beanstalk_environment.core-dev-env.cname} \
Namespace=aws:elasticbeanstalk:application:environment,OptionName=KAFKA_MIDDLEWARE_URL,Value=https://${aws_elastic_beanstalk_environment.middleware-dev-env.cname}
EOT
  }
}

# ---------------------------
# PATCH: CORE (DEV) -> set KAFKA_MIDDLEWARE_URL only
# ---------------------------
resource "null_resource" "patch_core_dev_envvars" {
  triggers = {
    middleware_cname = aws_elastic_beanstalk_environment.middleware-dev-env.cname
    env_name         = aws_elastic_beanstalk_environment.core-dev-env.name
  }

  depends_on = [
    aws_elastic_beanstalk_environment.core-dev-env,
    aws_elastic_beanstalk_environment.middleware-dev-env
  ]

  provisioner "local-exec" {
    command = <<EOT
aws elasticbeanstalk update-environment \
  --environment-name ${aws_elastic_beanstalk_environment.core-dev-env.name} \
  --option-settings \
Namespace=aws:elasticbeanstalk:application:environment,OptionName=KAFKA_MIDDLEWARE_URL,Value=https://${aws_elastic_beanstalk_environment.middleware-dev-env.cname}
EOT
  }
}

# ---------------------------
# PATCH: MIDDLEWARE (DEV) -> set CORE_API_URL only
# ---------------------------
resource "null_resource" "patch_middleware_dev_envvars" {
  triggers = {
    core_cname = aws_elastic_beanstalk_environment.core-dev-env.cname
    env_name   = aws_elastic_beanstalk_environment.middleware-dev-env.name
  }

  depends_on = [
    aws_elastic_beanstalk_environment.middleware-dev-env,
    aws_elastic_beanstalk_environment.core-dev-env
  ]

  provisioner "local-exec" {
    command = <<EOT
aws elasticbeanstalk update-environment \
  --environment-name ${aws_elastic_beanstalk_environment.middleware-dev-env.name} \
  --option-settings \
Namespace=aws:elasticbeanstalk:application:environment,OptionName=CORE_API_URL,Value=https://${aws_elastic_beanstalk_environment.core-dev-env.cname}
EOT
  }
}

# OUTPUTS FOR CLOUDFRONT URLs 
output "ecommerce_dev_cname" {
  value = aws_elastic_beanstalk_environment.ecommerce-dev-env.cname
}

output "catalogue_dev_cname" {
  value = aws_elastic_beanstalk_environment.catalogue-dev-env.cname
}

output "core_dev_cname" {
  value = aws_elastic_beanstalk_environment.core-dev-env.cname
}

output "analytics_dev_cname" {
  value = aws_elastic_beanstalk_environment.analytics-dev-env.cname
}
