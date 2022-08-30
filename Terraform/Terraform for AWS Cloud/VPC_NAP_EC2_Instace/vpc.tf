#Create AWS VPC
resource "aws_vpc" "levelup_vpc" {
  cidr_block       = "10.0.0.0/16"
  # instance stay on it
  instance_tenancy = "default"
  enable_dns_support = true
  enable_dns_hostnames = true
  enable_classiclink = false

  tags = {
    Name = "levelup_vpc"
  }
}

#Public Subnets

#Subnets in Custom VPC
resource "aws_subnet" "levelupvpc-public-1" {
  vpc_id     = aws_vpc.levelup_vpc
  cidr_block = "10.0.1.0/24"
  map_public_ip_on_launch = true
  availability_zone = "us-east-2a"

  tags = {
    Name = "levelupvpc-public-1"
  }
}

#Subnets in Custom VPC
resource "aws_subnet" "levelupvpc-public-2" {
  vpc_id     = aws_vpc.levelup_vpc
  cidr_block = "10.0.2.0/24"
  map_public_ip_on_launch = true
  availability_zone = "us-east-2b"

  tags = {
    Name = "levelupvpc-public-2"
  }
}

#Subnets in Custom VPC
resource "aws_subnet" "levelupvpc-public-3" {
  vpc_id     = aws_vpc.levelup_vpc
  cidr_block = "10.0.3.0/24"
  map_public_ip_on_launch = true
  availability_zone = "us-east-2c"

  tags = {
    Name = "levelupvpc-public-3"
  }
}


#Private Subnets

#Subnets in Custom VPC
resource "aws_subnet" "levelupvpc-private-1" {
  vpc_id     = aws_vpc.levelup_vpc
  cidr_block = "10.0.4.0/24"
  map_public_ip_on_launch = false
  availability_zone = "us-east-2a"

  tags = {
    Name = "levelupvpc-private-1"
  }
}

#Subnets in Custom VPC
resource "aws_subnet" "levelupvpc-private-2" {
  vpc_id     = aws_vpc.levelup_vpc
  cidr_block = "10.0.5.0/24"
  map_public_ip_on_launch = false
  availability_zone = "us-east-2b"

  tags = {
    Name = "levelupvpc-private-2"
  }
}

#Subnets in Custom VPC
resource "aws_subnet" "levelupvpc-private-3" {
  vpc_id     = aws_vpc.levelup_vpc
  cidr_block = "10.0.6.0/24"
  map_public_ip_on_launch = false
  availability_zone = "us-east-2c"

  tags = {
    Name = "levelupvpc-private-3"
  }
}

# Defining the Internet Gateway for the VPC
resource "aws_internet_gateway" "levelup-gw" {
  vpc_id = aws_vpc.levelup_vpc

  tags = {
    Name = "levelup-gw"
  }
}

#Defining The Routing Tables
resource "aws_route_table" "levelup-public" {
  vpc_id = aws_vpc.levelup_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.levelup-gw.id
  }

#   route {
#     ipv6_cidr_block        = "::/0"
#     egress_only_gateway_id = aws_egress_only_internet_gateway.example.id
#   }

  tags = {
    Name = "levelup-public"
  }
}

#Defining the Route Table.
resource "aws_route_table_association" "levelup-public-1-a" {
#public subnets
  subnet_id      = aws_subnet.levelupvpc-public-1.id
  route_table_id = aws_route_table.levelup-public
}

resource "aws_route_table_association" "levelup-public-2-a" {
#public subnets
  subnet_id      = aws_subnet.levelupvpc-public-2.id
  route_table_id = aws_route_table.levelup-public
}

resource "aws_route_table_association" "levelup-public-3-a" {
#public subnets
  subnet_id      = aws_subnet.levelupvpc-public-3.id
  route_table_id = aws_route_table.levelup-public
}