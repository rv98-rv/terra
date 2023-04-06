resource "aws_subnet" "demo1" {
  vpc_id            = aws_vpc.demo.id
  cidr_block        = "10.15.1.0/24"
  availability_zone = "ap-south-1a"

  tags = {
    Name = "Subnet_1"
  }
}
resource "aws_subnet" "demo2" {
  vpc_id            = aws_vpc.demo.id
  cidr_block        = "10.15.2.0/25"
  availability_zone = "ap-south-1b"

  tags = {
    Name = "Subnet_2"
  }
}
resource "aws_subnet" "demo3" {
  vpc_id            = aws_vpc.demo.id
  cidr_block        = "10.15.3.0/25"
  availability_zone = "ap-south-1c"

  tags = {
    Name = "Subnet_3"
  }
}
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.demo.id

  tags = {
    Name = "RV_VPC_IGW"
  }
}
resource "aws_route_table" "igw_rt" {
  vpc_id = aws_vpc.demo.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = {
    Name = "Public_Route_tables"
  }
}
resource "aws_route_table" "igw_rt1" {
  vpc_id = aws_vpc.demo.id

  tags = {
    Name = "Private_Route_tables"
  }
}
resource "aws_route_table_association" "a_rt" {
  subnet_id      = aws_subnet.demo1.id
  route_table_id = aws_route_table.igw_rt.id
}
resource "aws_route_table_association" "a_rt1" {
  subnet_id      = aws_subnet.demo2.id
  route_table_id = aws_route_table.igw_rt1.id

}
resource "aws_route_table_association" "a_rt2" {
  subnet_id      = aws_subnet.demo3.id
  route_table_id = aws_route_table.igw_rt1.id

}