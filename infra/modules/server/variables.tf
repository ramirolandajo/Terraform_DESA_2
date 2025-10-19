variable "project" {
  description = "Project identifier used for tagging."
  type        = string
}

variable "environment" {
  description = "Environment name (e.g. shared, dev, prod)."
  type        = string
}

variable "name" {
  description = "Logical name for the server."
  type        = string
}

variable "ami" {
  description = "AMI ID for the EC2 instance."
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type."
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID where the instance will be launched."
  type        = string
}

variable "associate_public_ip_address" {
  description = "Whether to associate a public IP address."
  type        = bool
  default     = true
}

variable "key_name" {
  description = "Name of the SSH key pair."
  type        = string
  default     = null
}

variable "user_data" {
  description = "User data script for the instance."
  type        = string
  default     = null
}

variable "iam_instance_profile" {
  description = "IAM instance profile name or ARN."
  type        = string
  default     = null
}

variable "vpc_security_group_ids" {
  description = "List of existing security group IDs to associate with the instance."
  type        = list(string)
  default     = []
}

variable "create_security_group" {
  description = "Whether to create a dedicated security group. Requires vpc_id when true."
  type        = bool
  default     = true
}

variable "vpc_id" {
  description = "VPC ID used when creating a security group."
  type        = string
  default     = null
}

variable "security_group_name" {
  description = "Optional custom name for the created security group."
  type        = string
  default     = null
}

variable "ingress_rules" {
  description = "List of ingress rule objects for the managed security group."
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
  description = "Optional root block device configuration."
  type = object({
    volume_size = optional(number)
    volume_type = optional(string)
    encrypted   = optional(bool)
  })
  default = null
}

variable "tags" {
  description = "Additional tags to apply to created resources."
  type        = map(string)
  default     = {}
}
