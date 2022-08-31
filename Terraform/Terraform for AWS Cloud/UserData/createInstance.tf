resource "aws_key_pair" "levelup_key" {
  key_name = "levelup_key"
  public_key = file(var.PATH_TO_PUBLIC_KEY)
}

resource "aws_instance" "MyFirstInstance" {
  ami = lookup(var.AMIS, var.AWS_REGION)
  availability_zone = "us-east-2a"
  instance_type = "t2.micro"
  key_name = aws_key_pair.levelup_key.key_name

  user_data = file("installApache.sh")

  tags = {
    "Name" = "custom_instance"
  }
}

output "public_ip" {
  value = aws_instance.MyFirstInstance.public_ip
}