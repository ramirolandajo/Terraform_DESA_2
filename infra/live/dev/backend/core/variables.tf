variable "aws_region" {
  description = "AWS region where resources will be created."
  type        = string
}

variable "project" {
  description = "Project identifier used for naming and tagging."
  type        = string
}

variable "application_name" {
  description = "Optional explicit Elastic Beanstalk application name."
  type        = string
  default     = null
}

variable "application_description" {
  description = "Description for the Elastic Beanstalk application."
  type        = string
  default     = "Managed by Terraform"
}

variable "environment_name" {
  description = "Optional explicit Elastic Beanstalk environment name."
  type        = string
  default     = null
}

variable "environment_description" {
  description = "Description of the Elastic Beanstalk environment."
  type        = string
  default     = "Managed by Terraform"
}

variable "solution_stack_name" {
  description = "Solution stack name for the environment (e.g. 64bit Amazon Linux 2 v5.8.4 running Node.js 16)."
  type        = string
}

variable "tier" {
  description = "Elastic Beanstalk environment tier."
  type        = string
  default     = "WebServer"
}

variable "cname_prefix" {
  description = "Optional CNAME prefix for the environment URL."
  type        = string
  default     = null
}

variable "version_label" {
  description = "Application version label to deploy."
  type        = string
  default     = "initial"
}

variable "version_description" {
  description = "Description of the application version."
  type        = string
  default     = "Managed by Terraform"
}

variable "version_s3_bucket" {
  description = "Optional S3 bucket containing the application bundle."
  type        = string
  default     = null
}

variable "version_s3_key" {
  description = "Optional S3 key for the application bundle."
  type        = string
  default     = null
}

variable "settings" {
  description = "Additional Elastic Beanstalk environment settings."
  type = list(object({
    namespace = string
    name      = string
    value     = string
  }))
  default = []
}

variable "tags" {
  description = "Additional tags applied to resources."
  type        = map(string)
  default     = {}
}
