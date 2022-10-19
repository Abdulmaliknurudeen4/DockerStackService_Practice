provider "aws" {
  region = var.AWS_REGION
  access_key = "xxxxxxxxxxxxxxxxxxxxxxxx"
  secret_key = "XXXXXXXXXXXXXXX"
}

data "aws_region" "current" {
}

data "aws_availability_zones" "available" {
}

provider "http" {
}