resource "aws_instance" "rajesh-vpc-ec2" {
  count                         = 2
  ami                           = "ami-098e42ae54c764c35"
  instance_type                 = "t3a.micro"
  key_name                      = "scbcep-dhana"
  vpc_security_group_ids        = [aws_security_group.dhana-vpc-sg.id]
  subnet_id                     = aws_subnet.dhana-vpc-pb-2a.id
  associate_public_ip_address   = "true"
tags = {
    Name = "dhana-vpc_${count.index}"
  }
}
