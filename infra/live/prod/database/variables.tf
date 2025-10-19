variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "identifier" {
  type    = string
  default = "prod-database"
}

variable "db_name" {
  type    = string
  default = "proddb"
}

variable "username" {
  type    = string
  default = "produser"
}

variable "password" {
  type = string
}

variable "instance_class" {
  type    = string
  default = "db.t3.micro"
}

variable "engine" {
  type    = string
  default = "postgres"
}

variable "engine_version" {
  type    = string
  default = "14.9"
}

variable "allocated_storage" {
  type    = number
  default = 20
}
