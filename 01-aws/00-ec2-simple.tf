resource "aws_instance" "tier-front" {
  ami           = "ami-098e42ae54c764c35"
  instance_type = "t3a.micro"
  subnet_id = "subnet-080c702efae7815b3"

  tags = {
    Name = "terraform-ec2-dhana"
  }
}
