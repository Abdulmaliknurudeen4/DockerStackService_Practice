#Security Group for the Level Up VPC
resource "aws_security_group" "allow-levelup-ssh" {
  name        = "allow-levelup-ssh"
  description = "Allow SSH inbound traffic from developers"
  vpc_id      = aws_vpc.levelup_vpc.id

  ingress {
    
     # where the traffic will be accepted.
     #ingress traffic should always be limited.
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    #specify your machine's IP address for access purpose
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
   #internet access for my machine
    description      = "SSH INTO VPc"
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow-levelup-ssh"
  }
}

#Security Group for MariaDB
resource "aws_security_group" "allow-mariadb" {
  name        = "allow-mariadb"
  description = "Security group for maria db"
  vpc_id      = aws_vpc.levelup_vpc.id

  ingress {
    
     # where the traffic will be accepted.
     #ingress traffic should always be limited. for mariaDB
    from_port        = 3306
    to_port          = 3306
    protocol         = "tcp"
    #specify that only machines created within the declared
    # security group can access the RDS
    security_groups = [aws_security_group.allow-levelup-ssh.id]
  }

  egress {
   #internet access for my machine
    description      = "SSH INTO VPc"
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow-mariadb"
  }
}
