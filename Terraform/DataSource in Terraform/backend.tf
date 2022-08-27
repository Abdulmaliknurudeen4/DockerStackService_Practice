terraform {
  backend "s3" {
    bucket = "terraform-bucket-722432s"
    key = "development/terraform_state"
    region = "us-east-2"
  }
}