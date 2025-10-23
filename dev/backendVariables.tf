variable "env_vars_ecommerce" {
  description = "Env variables for the Ecommerce EB Backend"
  type = map(string)
  sensitive = true
}

variable "env_vars_catalogue" {
  description = "Env variables for the Catalogue EB Backend"
  type = map(string)
  sensitive = true
  
}

variable "env_vars_analytics" {
  description = "Env variables for the Analytics EB Backend"
  type = map(string)
  sensitive = true
}

variable "env_vars_core" {
  description = "Env variables for the Core EB Backend"
  type = map(string)
  sensitive = true
}

variable "env_vars_middleware" {
  description = "Env variables for the Middleware EB Backend"
  type = map(string)
  sensitive = true
}

variable "region" {
  description = "AWS region to deploy resources in"
  type        = string
  default     = "sa-east-1"
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

variable "project_name" {
  description = "Name of the project"
  type        = string
  default     = "CompuMundoHMR"
}
