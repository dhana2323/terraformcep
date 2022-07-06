resource "aws_subnet" "dhana-vpc-pb-2a" {
  vpc_id = aws_vpc.dhana-vpc.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-west-2a"
    map_public_ip_on_launch = true

    tags ={
        Name = "dhana-vpc-pb-2a"
    }
}
resource "aws_route_table_association" "pb-2a" {
  subnet_id      = aws_subnet.dhana-vpc-pb-2a.id
  route_table_id = aws_route_table.dhana-vpc-rt-pb.id
}

resource "aws_subnet" "dhana-vpc-pb-2b" {
    vpc_id = aws_vpc.dhana-vpc.id
  cidr_block = "10.0.3.0/24"
  availability_zone = "us-west-2b"
    map_public_ip_on_launch = true

    tags ={
        Name = "dhana-vpc-pb-2b"
    }
}
resource "aws_route_table_association" "pb-2b" {
  subnet_id      = aws_subnet.dhana-vpc-pb-2b.id
  route_table_id = aws_route_table.dhana-vpc-rt-pb.id
}

resource "aws_eip" "nat_gateway" {
  vpc = true
}
resource "aws_nat_gateway" "dhana-vpc-nat-gw" {
  allocation_id = aws_eip.nat_gateway.id
  subnet_id     = aws_subnet.dhana-vpc-pb-2a.id

  tags = {
    Name = "dhana-vpc-nat-gw"
  }
  depends_on = [aws_internet_gateway.dhana-vpc-igw]
}

resource "aws_route_table" "dhana-vpc-rt-pvt" {
  vpc_id = aws_vpc.dhana-vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.dhana-vpc-nat-gw.id
  }
}

resource "aws_subnet" "dhana-vpc-pvt-2a" {
    vpc_id = aws_vpc.dhana-vpc.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "us-west-2a"
    tags ={
        Name = "dhana-vpc-pvt-2a"
    }
}
resource "aws_route_table_association" "pvt-2a" {
  subnet_id      = aws_subnet.dhana-vpc-pvt-2a.id
  route_table_id = aws_route_table.dhana-vpc-rt-pvt.id
}
resource "aws_subnet" "dhana-vpc-pvt-2b" {
    vpc_id = aws_vpc.dhana-vpc.id
  cidr_block = "10.0.4.0/24"
  availability_zone = "us-west-2a"
    tags ={
        Name = "dhana-vpc-pvt-2b"
    }
}
resource "aws_route_table_association" "pvt-2b" {
  subnet_id      = aws_subnet.dhana-vpc-pvt-2b.id
  route_table_id = aws_route_table.dhana-vpc-rt-pvt.id
}
