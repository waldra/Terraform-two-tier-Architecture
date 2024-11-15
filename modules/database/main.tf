resource "aws_db_subnet_group" "db_subnet_group" {
  name       = var.db_subnet_name
  subnet_ids = var.subnet_ids
}


resource "aws_db_instance" "db" {
  engine                      = var.engine
  engine_version              = var.engine_version
  instance_class              = var.instance_class
  allocated_storage           = var.allocated_storage
  storage_type                = var.storage_type
  multi_az                    = var.multi_az
  db_name                     = var.db_name
  username                    = var.username
  password                    = var.password
  parameter_group_name        = var.parameter_group_name
  allow_major_version_upgrade = var.allow_major_version_upgrade
  auto_minor_version_upgrade  = var.auto_minor_version_upgrade
  backup_retention_period     = var.backup_retention_period
  skip_final_snapshot         = var.skip_final_snapshot
  publicly_accessible         = var.publicly_accessible
  vpc_security_group_ids      = [var.db_sg_id]
  db_subnet_group_name = aws_db_subnet_group.db_subnet_group.name

  tags = {
    Name = var.db_name
  }

}

