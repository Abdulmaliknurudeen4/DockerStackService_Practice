#Define External IP
resource "aws_eip" "levelup-nat" {
  vpc = true
}

resource "aws_nat_gateway" "levelup-nat-gw" {
  allocation_id = aws_eip.levelup-nat.id
  subnet_id = aws_subnet.levelupvpc-public-1.id
  depends_on = [
    aws_internet_gateway.levelup-gw
  ]
}

#Defining The Routing Tables so internet can't access the internet
resource "aws_route_table" "levelup-private" {
  vpc_id = aws_vpc.levelup_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.levelup-nat-gw.id
  }

#   route {
#     ipv6_cidr_block        = "::/0"
#     egress_only_gateway_id = aws_egress_only_internet_gateway.example.id
#   }

  tags = {
    Name = "levelup-private"
  }
}

#Defining association private
resource "aws_route_table_association" "levelup-private-1-a" {
#public subnets
  subnet_id      = aws_subnet.levelupvpc-private-1.id
  route_table_id = aws_route_table.levelup-private.id
}

resource "aws_route_table_association" "levelup-private-1-b" {
#public subnets
  subnet_id      = aws_subnet.levelupvpc-private-2.id
  route_table_id = aws_route_table.levelup-private.id
}

resource "aws_route_table_association" "levelup-private-1-c" {
#public subnets
  subnet_id      = aws_subnet.levelupvpc-private-3.id
  route_table_id = aws_route_table.levelup-private.id
}