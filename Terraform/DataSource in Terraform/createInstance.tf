data "aws_availability_zones" "availability" {
  
}

resource "aws_instance" "MyFirstInstance" {
  ami = lookup(var.AMIS, var.AWS_REGION)
  instance_type = "t2.micro"
  availability_zone = data.aws_availability_zones.availability.names[0]

  tags = {
    "Name" = "custom_instance"
  }
}