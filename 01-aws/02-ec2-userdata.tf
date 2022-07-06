resource "aws_instance" "apache-server" {
  ami = "ami-098e42ae54c764c35" 
  instance_type = "t3a.nano"
  subnet_id = "subnet-080c702efae7815b3"
  tags={
    Name = "terraform-httpd-dhana"
  }
  user_data = <<EOF
    #!/bin/bash
    sudo yum update -y
    sudo yum install httpd -y
    sudo systemctl enable httpd
    sudo systemctl start httpd
  EOF
}
