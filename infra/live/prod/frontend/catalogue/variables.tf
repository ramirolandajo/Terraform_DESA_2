variable "aws_region" {
  description = "AWS region where resources will be created."
  type        = string
}

variable "project" {
  description = "Project identifier used for naming and tagging."
  type        = string
}

variable "bucket_name" {
  description = "Optional explicit S3 bucket name."
  type        = string
  default     = null
}

variable "aliases" {
  description = "CloudFront aliases for the distribution."
  type        = list(string)
  default     = []
}

variable "certificate_arn" {
  description = "ACM certificate ARN for HTTPS."
  type        = string
  default     = null
}

variable "default_root_object" {
  description = "Default object served by CloudFront."
  type        = string
  default     = "index.html"
}

variable "tags" {
  description = "Additional tags applied to resources."
  type        = map(string)
  default     = {}
}
