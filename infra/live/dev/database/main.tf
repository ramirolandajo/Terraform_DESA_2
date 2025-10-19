terraform {
  required_version = ">= 1.5.0"

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

locals {
  project     = var.project
  environment = "dev"
}

module "database" {
  source = "../../../modules/database"

  project                        = local.project
  environment                    = local.environment
  component                      = var.component
  identifier                     = var.identifier
  engine                         = var.engine
  engine_version                 = var.engine_version
  instance_class                 = var.instance_class
  allocated_storage              = var.allocated_storage
  max_allocated_storage          = var.max_allocated_storage
  username                       = var.username
  password                       = var.password
  db_name                        = var.db_name
  port                           = var.port
  storage_encrypted              = var.storage_encrypted
  multi_az                       = var.multi_az
  storage_type                   = var.storage_type
  publicly_accessible            = var.publicly_accessible
  deletion_protection            = var.deletion_protection
  backup_retention_period        = var.backup_retention_period
  maintenance_window             = var.maintenance_window
  backup_window                  = var.backup_window
  apply_immediately              = var.apply_immediately
  skip_final_snapshot            = var.skip_final_snapshot
  final_snapshot_identifier      = var.final_snapshot_identifier
  auto_minor_version_upgrade     = var.auto_minor_version_upgrade
  performance_insights_enabled   = var.performance_insights_enabled
  performance_insights_retention_period = var.performance_insights_retention_period
  monitoring_interval            = var.monitoring_interval
  monitoring_role_arn            = var.monitoring_role_arn
  parameter_group_name           = var.parameter_group_name
  option_group_name              = var.option_group_name
  subnet_group_name              = var.subnet_group_name
  vpc_security_group_ids         = var.vpc_security_group_ids
  tags                           = var.tags
}
