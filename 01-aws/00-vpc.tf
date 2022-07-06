
resource "aws_vpc" "dhana-vpc" {
  cidr_block = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true
    tags = {
    Name = "dhana-vpc"
  }
}
resource "aws_internet_gateway" "dhana-vpc-igw" {
  vpc_id = aws_vpc.dhana-vpc.id
  tags ={
    Name = "dhana-vpc-igw"
  }
}
resource "aws_route_table" "dhana-vpc-rt-pb" {
  
  vpc_id = aws_vpc.dhana-vpc.id
  route{
      cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.dhana-vpc-igw.id
  }
  tags ={
    Name = "dhana-vpc-rt-pb"
  }
}


