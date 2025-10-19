resource "aws_db_instance" "db" {
  identifier              = var.identifier
  db_name                 = var.db_name
  engine                  = var.engine
  engine_version          = var.engine_version
  instance_class          = var.instance_class
  allocated_storage       = var.allocated_storage
  username                = var.username
  password                = var.password
  publicly_accessible     = true
  skip_final_snapshot     = true
  deletion_protection     = false
}

output "endpoint" {
  value = aws_db_instance.db.address
}
