resource "aws_instance" "MyFirstInstance" {
  ami = lookup(var.AMIS, var.AWS_REGION)
  instance_type = "t2.micro"
  count = 3

  tags={
    Name = "demoinstance-${count.index}"
  }

  security_groups = "${var.Security_Group}"
}