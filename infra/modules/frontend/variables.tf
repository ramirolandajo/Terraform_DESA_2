variable "project" {
  description = "Project identifier used in naming resources."
  type        = string
}

variable "environment" {
  description = "Environment name (e.g. dev, prod)."
  type        = string
}

variable "module_name" {
  description = "Module or application component name (e.g. ecommerce)."
  type        = string
}

variable "bucket_name" {
  description = "Optional override for the S3 bucket name."
  type        = string
  default     = null
}

variable "aliases" {
  description = "Optional list of alternate domain names for the CloudFront distribution."
  type        = list(string)
  default     = []
}

variable "certificate_arn" {
  description = "Optional ACM certificate ARN for HTTPS custom domains."
  type        = string
  default     = null
}

variable "default_root_object" {
  description = "Default root object served by CloudFront."
  type        = string
  default     = "index.html"
}

variable "tags" {
  description = "Additional tags to associate with created resources."
  type        = map(string)
  default     = {}
}
