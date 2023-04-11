#Creating VPC
resource "aws_vpc" "demo" {
  cidr_block       = "10.15.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "RV_VPC_TF"
  }
}

#Creating a subnet 1
resource "aws_subnet" "demo1" {
  vpc_id                  = aws_vpc.demo.id
  cidr_block              = "10.15.1.0/24"
  availability_zone       = "ap-south-1a"
  map_public_ip_on_launch = "true"
  tags = {
    Name = "Subnet_1"
  }
}

#Creating a subnet 2
resource "aws_subnet" "demo2" {
  vpc_id            = aws_vpc.demo.id
  cidr_block        = "10.15.2.0/25"
  availability_zone = "ap-south-1b"

  tags = {
    Name = "Subnet_2"
  }
}

#Creating a subnet 3
resource "aws_subnet" "demo3" {
  vpc_id            = aws_vpc.demo.id
  cidr_block        = "10.15.3.0/25"
  availability_zone = "ap-south-1c"

  tags = {
    Name = "Subnet_3"
  }
}

#Creating a Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.demo.id

  tags = {
    Name = "RV_VPC_IGW"
  }
}

#Creating a Route Table and attaching it to Internet Gateway(using route function inside the block)
#called as Public Route Table
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
#Creating a Route Table and not attaching it to Internet Gateway
#called as Private Route Table
resource "aws_route_table" "igw_rt1" {
  vpc_id = aws_vpc.demo.id

  tags = {
    Name = "Private_Route_tables"
  }
}

#Attaching subnet1 to Public Subnet
resource "aws_route_table_association" "a_rt" {
  subnet_id      = aws_subnet.demo1.id
  route_table_id = aws_route_table.igw_rt.id
}

#Attaching subnet2 to Private Subnet
resource "aws_route_table_association" "a_rt1" {
  subnet_id      = aws_subnet.demo2.id
  route_table_id = aws_route_table.igw_rt1.id

}

#Attaching subnet3 to Private Subnet
resource "aws_route_table_association" "a_rt2" {
  subnet_id      = aws_subnet.demo3.id
  route_table_id = aws_route_table.igw_rt1.id

}
