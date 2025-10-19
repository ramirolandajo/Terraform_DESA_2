variable "aws_region" {
  description = "AWS region for the database."
  type        = string
}

variable "project" {
  description = "Project identifier used for naming and tagging."
  type        = string
}

variable "component" {
  description = "Logical component name for tagging."
  type        = string
  default     = "database"
}

variable "identifier" {
  description = "RDS instance identifier."
  type        = string
}

variable "engine" {
  description = "Database engine (e.g. postgres, mysql)."
  type        = string
}

variable "engine_version" {
  description = "Database engine version."
  type        = string
}

variable "instance_class" {
  description = "RDS instance class."
  type        = string
}

variable "allocated_storage" {
  description = "Allocated storage in GB."
  type        = number
}

variable "max_allocated_storage" {
  description = "Maximum storage for autoscaling in GB."
  type        = number
  default     = null
}

variable "username" {
  description = "Master username."
  type        = string
}

variable "password" {
  description = "Master password."
  type        = string
  sensitive   = true
}

variable "db_name" {
  description = "Initial database name."
  type        = string
  default     = null
}

variable "port" {
  description = "Database port."
  type        = number
  default     = 5432
}

variable "storage_encrypted" {
  description = "Enable storage encryption."
  type        = bool
  default     = true
}

variable "multi_az" {
  description = "Deploy as Multi-AZ."
  type        = bool
  default     = true
}

variable "storage_type" {
  description = "RDS storage type."
  type        = string
  default     = "gp3"
}

variable "publicly_accessible" {
  description = "Whether the instance is publicly accessible."
  type        = bool
  default     = false
}

variable "deletion_protection" {
  description = "Enable deletion protection."
  type        = bool
  default     = true
}

variable "backup_retention_period" {
  description = "Backup retention period in days."
  type        = number
  default     = 7
}

variable "maintenance_window" {
  description = "Preferred maintenance window."
  type        = string
  default     = null
}

variable "backup_window" {
  description = "Preferred backup window."
  type        = string
  default     = null
}

variable "apply_immediately" {
  description = "Apply modifications immediately."
  type        = bool
  default     = false
}

variable "skip_final_snapshot" {
  description = "Skip final snapshot on destroy."
  type        = bool
  default     = false
}

variable "final_snapshot_identifier" {
  description = "Final snapshot identifier when skip_final_snapshot is false."
  type        = string
  default     = null
}

variable "auto_minor_version_upgrade" {
  description = "Enable automatic minor version upgrades."
  type        = bool
  default     = true
}

variable "performance_insights_enabled" {
  description = "Enable Performance Insights."
  type        = bool
  default     = false
}

variable "performance_insights_retention_period" {
  description = "Performance Insights retention period in days."
  type        = number
  default     = null
}

variable "monitoring_interval" {
  description = "Enhanced monitoring interval in seconds."
  type        = number
  default     = 0
}

variable "monitoring_role_arn" {
  description = "IAM role ARN for enhanced monitoring."
  type        = string
  default     = null
}

variable "parameter_group_name" {
  description = "DB parameter group name."
  type        = string
  default     = null
}

variable "option_group_name" {
  description = "DB option group name."
  type        = string
  default     = null
}

variable "subnet_group_name" {
  description = "DB subnet group name."
  type        = string
}

variable "vpc_security_group_ids" {
  description = "List of security group IDs."
  type        = list(string)
  default     = []
}

variable "tags" {
  description = "Additional tags applied to resources."
  type        = map(string)
  default     = {}
}
