provider "aws" {
  region = var.AWS_REGION
  access_key = "AKIA43OIJPT5PTZFKCDR"
  secret_key = "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"
}

data "aws_region" "current" {
}

data "aws_availability_zones" "available" {
}

provider "http" {
}