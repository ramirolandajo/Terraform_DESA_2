variable "aws_region" {
  description = "AWS region where the Kafka server will be deployed."
  type        = string
}

variable "project" {
  description = "Project identifier used for naming and tagging."
  type        = string
}

variable "ami" {
  description = "AMI ID for the Kafka server."
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type for the Kafka server."
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID for the instance."
  type        = string
}

variable "associate_public_ip_address" {
  description = "Whether to associate a public IP address."
  type        = bool
  default     = true
}

variable "key_name" {
  description = "SSH key pair name."
  type        = string
  default     = null
}

variable "user_data" {
  description = "User data script to configure Kafka."
  type        = string
  default     = null
}

variable "iam_instance_profile" {
  description = "IAM instance profile name or ARN."
  type        = string
  default     = null
}

variable "vpc_security_group_ids" {
  description = "Existing security group IDs to attach."
  type        = list(string)
  default     = []
}

variable "create_security_group" {
  description = "Whether to create a dedicated security group."
  type        = bool
  default     = true
}

variable "vpc_id" {
  description = "VPC ID used when creating a security group."
  type        = string
  default     = null
}

variable "security_group_name" {
  description = "Custom security group name."
  type        = string
  default     = null
}

variable "ingress_rules" {
  description = "Ingress rules for the managed security group."
  type = list(object({
    description      = optional(string)
    from_port        = number
    to_port          = number
    protocol         = string
    cidr_blocks      = optional(list(string), [])
    ipv6_cidr_blocks = optional(list(string), [])
    security_groups  = optional(list(string), [])
  }))
  default = []
}

variable "root_block_device" {
  description = "Root block device configuration."
  type = object({
    volume_size = optional(number)
    volume_type = optional(string)
    encrypted   = optional(bool)
  })
  default = null
}

variable "tags" {
  description = "Additional tags applied to resources."
  type        = map(string)
  default     = {}
}
