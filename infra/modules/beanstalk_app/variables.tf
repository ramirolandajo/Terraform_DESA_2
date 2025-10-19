variable "project" {
  description = "Project identifier used for tagging and naming."
  type        = string
}

variable "environment" {
  description = "Environment identifier (e.g. dev, prod)."
  type        = string
}

variable "module_name" {
  description = "Logical name for the application module (e.g. ecommerce)."
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
  description = "Description for the Elastic Beanstalk environment."
  type        = string
  default     = "Managed by Terraform"
}

variable "solution_stack_name" {
  description = "Solution stack name to use for the environment."
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
  description = "Label of the application version to deploy."
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
  description = "Optional S3 key for the application bundle. Required if version_s3_bucket is set."
  type        = string
  default     = null
}

variable "settings" {
  description = "List of additional Elastic Beanstalk configuration settings."
  type = list(object({
    namespace = string
    name      = string
    value     = string
  }))
  default = []
}

variable "tags" {
  description = "Additional tags to associate with the resources."
  type        = map(string)
  default     = {}
}
