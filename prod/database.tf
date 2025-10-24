# resource "aws_db_instance" "mysql" {
#   provider = aws.admin_3
#   identifier              = "prod-db-desarrollo2"
#   engine                  = "mysql"
#   instance_class          = var.db_instance_class
#   allocated_storage       = var.db_allocated_storage
#   username                = var.db_username
#   password                = var.db_password
#   skip_final_snapshot     = true
#   publicly_accessible     = true
#   deletion_protection     = false
#   auto_minor_version_upgrade = true
#   backup_retention_period = 0
# }
