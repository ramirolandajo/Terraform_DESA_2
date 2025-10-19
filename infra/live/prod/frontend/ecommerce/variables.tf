variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "bucket_name" {
  type = string
}

variable "distribution_comment" {
  type    = string
  default = "Ecommerce FE Prod"
}

variable "default_root_object" {
  type    = string
  default = "index.html"
}
