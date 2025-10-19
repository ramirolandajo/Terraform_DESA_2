locals {
  sg_enabled = var.create_security_group && var.vpc_id != null
}

resource "aws_security_group" "this" {
  count = local.sg_enabled ? 1 : 0

  name        = coalesce(var.security_group_name, "${var.project}-${var.name}-sg")
  description = "Security group for ${var.name}"
  vpc_id      = var.vpc_id

  dynamic "ingress" {
    for_each = var.ingress_rules
    content {
      description      = lookup(ingress.value, "description", null)
      from_port        = ingress.value.from_port
      to_port          = ingress.value.to_port
      protocol         = ingress.value.protocol
      cidr_blocks      = lookup(ingress.value, "cidr_blocks", [])
      ipv6_cidr_blocks = lookup(ingress.value, "ipv6_cidr_blocks", [])
      security_groups  = lookup(ingress.value, "security_groups", [])
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = merge(
    {
      "Project"     = var.project
      "Environment" = var.environment
      "Component"   = var.name
      "ManagedBy"   = "terraform"
    },
    var.tags
  )
}

locals {
  security_group_ids = local.sg_enabled ? concat(var.vpc_security_group_ids, [aws_security_group.this[0].id]) : var.vpc_security_group_ids
}

resource "aws_instance" "this" {
  ami                         = var.ami
  instance_type               = var.instance_type
  subnet_id                   = var.subnet_id
  associate_public_ip_address = var.associate_public_ip_address
  key_name                    = var.key_name
  user_data                   = var.user_data
  iam_instance_profile        = var.iam_instance_profile
  vpc_security_group_ids      = local.security_group_ids

  dynamic "root_block_device" {
    for_each = var.root_block_device == null ? [] : [var.root_block_device]
    content {
      volume_size = lookup(root_block_device.value, "volume_size", null)
      volume_type = lookup(root_block_device.value, "volume_type", null)
      encrypted   = lookup(root_block_device.value, "encrypted", null)
    }
  }

  tags = merge(
    {
      "Name"        = "${var.project}-${var.name}"
      "Project"     = var.project
      "Environment" = var.environment
      "Component"   = var.name
      "ManagedBy"   = "terraform"
    },
    var.tags
  )
}

output "instance_id" {
  description = "ID of the created EC2 instance."
  value       = aws_instance.this.id
}

output "public_ip" {
  description = "Public IP of the EC2 instance."
  value       = aws_instance.this.public_ip
}

output "security_group_id" {
  description = "ID of the created security group (if any)."
  value       = local.sg_enabled ? aws_security_group.this[0].id : null
}
