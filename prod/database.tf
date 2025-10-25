resource "aws_db_instance" "mysql" {
  provider = aws.admin_3
  identifier              = "prod-db-desarrollo2"
  engine                  = "mysql"
  instance_class          = var.db_instance_class
  allocated_storage       = var.db_allocated_storage
  username                = var.db_username
  password                = var.db_password
  skip_final_snapshot     = true
  publicly_accessible     = true
  deletion_protection     = false
  auto_minor_version_upgrade = true
  backup_retention_period = 0
  vpc_security_group_ids = [aws_security_group.rds_mysql.id]
  
  lifecycle {
    prevent_destroy = true
  }
}

# Security Group for RDS MySQL allowing access
resource "aws_security_group" "rds_mysql" {
  provider    = aws.admin_3
  name        = "rds-mysql-public"
  vpc_id      = data.aws_vpc.default_vpc_3.id

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}