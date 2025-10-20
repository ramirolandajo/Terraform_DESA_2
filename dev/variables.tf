variable "env_vars" {
  type    = map(string)
  default = {
    //Agregar variables de entorno
  }
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