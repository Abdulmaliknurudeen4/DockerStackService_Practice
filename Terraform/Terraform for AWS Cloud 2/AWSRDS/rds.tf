#RDS Resources
resource "aws_db_subnet_group" "mariadb-subnets" {
  name = "mariadb-subnets"
  description = "Amazon RDS subnet grouP"
  subnet_ids = [aws_subnet.levelupvpc-private-1.id, aws_subnet.levelupvpc-private-2.id]
}

resource "aws_db_parameter_group" "levelup-mariadb-parameters" {
  name = "levelup-mariadb-parameters"
  family = "mariadb10.4"
  description = "Maria DB parameter Group"

  parameter {
    name = "max_allowed_packet"
    value="16777216"
  }
}
# Define the RDS INstance Properties
resource "aws_db_instance" "levelup-mariadb" {
  allocated_storage = 20
  engine = "mysql"
  engine_version = "5.7"
  instance_class = "db.t2.micro"
  identifier = "mysql"
  name = "mysqlme"
  username = "root"
  password = "password360444"
  db_subnet_group_name = aws_db_subnet_group.mariadb-subnets.name
  parameter_group_name = aws_db_parameter_group.levelup-mariadb-parameters.name
  multi_az = false
  vpc_security_group_ids = [aws_security_group.allow-mariadb.id]
  storage_type = "gp2"
  backup_retention_period = 30 # how long to keep your backup
  availability_zone = aws_subnet.levelupvpc-private-1.availability_zone # preferred AZ
  skip_final_snapshot = true
  tags = {
    "Name" = "levelup-mariadb"
  }
}

output "rds" {
  value = aws_db_instance.levelup-mariadb.endpoint
}