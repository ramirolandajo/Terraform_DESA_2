variable "project" {
  description = "Project identifier for tagging."
  type        = string
}

variable "environment" {
  description = "Environment name (e.g. dev, prod)."
  type        = string
}

variable "component" {
  description = "Logical component name for tagging."
  type        = string
  default     = "database"
}

variable "identifier" {
  description = "Unique identifier for the RDS instance."
  type        = string
}

variable "engine" {
  description = "Database engine (e.g. postgres, mysql)."
  type        = string
}

variable "engine_version" {
  description = "Version of the database engine."
  type        = string
}

variable "instance_class" {
  description = "Instance class for the RDS instance."
  type        = string
}

variable "allocated_storage" {
  description = "Initial storage allocated to the instance (in GB)."
  type        = number
}

variable "max_allocated_storage" {
  description = "Maximum storage for autoscaling (in GB)."
  type        = number
  default     = null
}

variable "username" {
  description = "Master username for the database."
  type        = string
}

variable "password" {
  description = "Master password for the database."
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
  description = "Whether to enable storage encryption."
  type        = bool
  default     = true
}

variable "multi_az" {
  description = "Whether to create a Multi-AZ deployment."
  type        = bool
  default     = false
}

variable "storage_type" {
  description = "Type of storage to use."
  type        = string
  default     = "gp3"
}

variable "publicly_accessible" {
  description = "Whether the instance should have a public IP address."
  type        = bool
  default     = false
}

variable "deletion_protection" {
  description = "Whether deletion protection is enabled."
  type        = bool
  default     = true
}

variable "backup_retention_period" {
  description = "Number of days to retain backups."
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
  description = "Whether modifications should be applied immediately."
  type        = bool
  default     = false
}

variable "skip_final_snapshot" {
  description = "Whether to skip the final snapshot on destroy."
  type        = bool
  default     = false
}

variable "final_snapshot_identifier" {
  description = "Name of the final snapshot if skip_final_snapshot is false."
  type        = string
  default     = null
}

variable "auto_minor_version_upgrade" {
  description = "Whether minor engine upgrades are applied automatically."
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
  description = "Name of the DB parameter group."
  type        = string
  default     = null
}

variable "option_group_name" {
  description = "Name of the DB option group."
  type        = string
  default     = null
}

variable "subnet_group_name" {
  description = "Name of the DB subnet group."
  type        = string
}

variable "vpc_security_group_ids" {
  description = "List of VPC security groups to associate with the instance."
  type        = list(string)
  default     = []
}

variable "tags" {
  description = "Additional tags for the RDS resources."
  type        = map(string)
  default     = {}
}
