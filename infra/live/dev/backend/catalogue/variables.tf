variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "application_name" {
  type    = string
  default = "Catalogue BE Dev App"
}

variable "environment_name" {
  type    = string
  default = "Catalogue BE Dev Env"
}

variable "solution_stack_name" {
  type    = string
  default = "64bit Amazon Linux 2 v5.8.5 running Node.js 16"
}

variable "cname_prefix" {
  type = string
}

variable "instance_type" {
  type    = string
  default = "t3.micro"
}
