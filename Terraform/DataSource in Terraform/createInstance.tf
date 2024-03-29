data "aws_availability_zones" "availability" {
  
}
data "aws_ami" "Latest-ubuntu" {
  # provides the metadata
  most_recent = true
  owners = ["099720109477"]
  
  filter {
    name = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-xenial-16.04-amd64-server-*"]
  }

  filter{
    name = "virtualization-type"
    values = ["hvm"]
  }
}
resource "aws_instance" "MyFirstInstance" {
  ami = data.aws_ami.Latest-ubuntu.id
  instance_type = "t2.micro"
  availability_zone = data.aws_availability_zones.availability.names[0]

  tags = {
    "Name" = "custom_instance"
  }

  provisioner "local-exec" {
      command = "echo ${aws_instance.MyFirstInstance.private_ip} >> my_private_ips.txt"
    }
  
}
 output "public_ip" {
    value = aws_instance.MyFirstInstance.public_ip
  }