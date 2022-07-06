data "aws_subnet_ids" "postgres" {
  vpc_id =vpc-02d1d9d0df74292f5
}
resource "aws_db_subnet_group" "db-subnet-grp" {
  subnet_ids = data.aws_subnet_ids.postgres.ids
}

resource "aws_db_instance" "postgres" {
  allocated_storage       = 20
  storage_type            = "gp2"
  engine                  = "postgres"
  instance_class          = "db.t3.micro"
  identifier              = "sigma-rdp"
  db_name           = "smartbankapp"
  username                = "postgres"
  password                = "postgres"
  db_subnet_group_name    = aws_db_subnet_group.db-subnet-grp.name
  vpc_security_group_ids  = [aws_security_group.db-sg.id]
  skip_final_snapshot     = "true"
}
