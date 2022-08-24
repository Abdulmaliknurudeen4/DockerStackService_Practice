provider "aws" {
  access_key = "AKIA43OIJPT5MM3C532S"
  secret_key = "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"
  region = "us-east-2"
}

resource "aws_instance" "MyFirstInstance" {
  ami = "ami-05803413c51f242b7"
  instance_type = "t2.micro"
}