resource "aws_db_instance" "mysql_db" {
  allocated_storage      = var.allocated_storage
  db_name                = var.db_name
  engine                 = var.engine
  engine_version         = var.engine_version
  instance_class         = var.instance_class
  username               = var.username
  password               = var.password
  db_subnet_group_name   = aws_db_subnet_group.db_default.id
  vpc_security_group_ids = [var.vpc_security_group_ids]
  skip_final_snapshot    = var.skip_final_snapshot
  tags = {
    Name=var.database_name
  }
}


resource "aws_db_subnet_group" "db_default" {
  subnet_ids = var.subnet_ids
  name       = "main"
  tags = {
    Name = var.subnet_group_name
  }

}