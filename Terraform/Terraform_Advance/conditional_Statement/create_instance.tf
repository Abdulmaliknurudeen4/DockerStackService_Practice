module "ec2_cluster" {
  source = "github.com/terraform-aws-modules/terraform-aws-ec2-instance.git"
  name = "myFirstInstance"

  ami                    = "ami-05803413c51f242b7"
  instance_type          = "t2.micro"
  monitoring             = true
  subnet_id              = "subnet-0480ba67e9338a3e7"
  instance_count = var.environment == "Production" ? 2 : 1

  tags = {
    Terraform   = "true"
    Environment = var.environment
  }
}
provider "aws" {
  access_key = "AKIA43OIJPT5PTZFKCDR"
  secret_key = "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"
  region = "us-east-2"
}