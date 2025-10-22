variable "db_username" {
  description = "Master username for the RDS MySQL instance."
  type        = string
}

variable "db_password" {
  description = "Master password for the RDS MySQL instance."
  type        = string
  sensitive   = true
}

variable "db_instance_class" {
  description = "Instance class for the RDS MySQL database."
  type        = string
  default     = "db.t4g.micro"
}

variable "db_allocated_storage" {
  description = "Allocated storage size (in GB) for the RDS MySQL database."
  type        = number
  default     = 20
}
