locals {
  application_name = coalesce(var.application_name, join("-", compact([
    var.project,
    var.environment,
    var.module_name,
    "app"
  ])))

  environment_name = coalesce(var.environment_name, join("-", compact([
    var.project,
    var.environment,
    var.module_name,
    "env"
  ])))
}

resource "aws_elastic_beanstalk_application" "this" {
  name        = local.application_name
  description = var.application_description

  lifecycle {
    ignore_changes = [tags]
  }

  tags = merge(
    {
      "Project"     = var.project
      "Environment" = var.environment
      "Component"   = var.module_name
      "ManagedBy"   = "terraform"
    },
    var.tags
  )
}

resource "aws_elastic_beanstalk_application_version" "this" {
  count = var.version_s3_bucket == null ? 0 : 1

  application = aws_elastic_beanstalk_application.this.name
  name        = var.version_label
  description = var.version_description
  bucket      = var.version_s3_bucket
  key         = var.version_s3_key
}

resource "aws_elastic_beanstalk_environment" "this" {
  name                = local.environment_name
  application         = aws_elastic_beanstalk_application.this.name
  solution_stack_name = var.solution_stack_name
  tier                = var.tier
  cname_prefix        = var.cname_prefix
  description         = var.environment_description
  version_label       = var.version_s3_bucket == null ? var.version_label : aws_elastic_beanstalk_application_version.this[0].name

  dynamic "setting" {
    for_each = var.settings
    content {
      namespace = setting.value.namespace
      name      = setting.value.name
      value     = setting.value.value
    }
  }

  tags = merge(
    {
      "Project"     = var.project
      "Environment" = var.environment
      "Component"   = var.module_name
      "ManagedBy"   = "terraform"
    },
    var.tags
  )
}

output "application_name" {
  description = "Elastic Beanstalk application name."
  value       = aws_elastic_beanstalk_application.this.name
}

output "environment_id" {
  description = "Elastic Beanstalk environment ID."
  value       = aws_elastic_beanstalk_environment.this.id
}

output "environment_cname" {
  description = "Elastic Beanstalk environment CNAME."
  value       = aws_elastic_beanstalk_environment.this.cname
}
