variable "env_vars_ecommerce_dev" {
  description = "Env variables for the Ecommerce EB Backend"
  type = map(string)
  sensitive = true
}

variable "env_vars_catalogue_dev" {
  description = "Env variables for the Catalogue EB Backend"
  type = map(string)
  sensitive = true
  
}

variable "env_vars_analytics_dev" {
  description = "Env variables for the Analytics EB Backend"
  type = map(string)
  sensitive = true
}

variable "env_vars_core_dev" {
  description = "Env variables for the Core EB Backend"
  type = map(string)
  sensitive = true
}

variable "env_vars_middleware_dev" {
  description = "Env variables for the Middleware EB Backend"
  type = map(string)
  sensitive = true
}


variable "backend_instance_type" {
  description = "EC2 instance type to use in EB"
  type        = string
  default     = "t3.micro"
}

variable "ec2_server_instance_type" {
  description = "EC2 instance type to use in Kafka+Keycloak servers"
  type        = string
  default     = "t3.small"
}

