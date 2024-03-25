resource "aws_db_instance" "db_01" {
  allocated_storage   = 5
  db_name             = "db01"
  engine              = "mysql"
  instance_class      = "db.t3.large"
  username            = var.rds_username
  password            = var.rds_password
  skip_final_snapshot = true


}