# Variable for Create Instance Module
variable "public_key_path" {
  description = "Public key path"
  default = "~/.ssh/levelup_key.pub"
}

variable "ENVIRONMENT" {
    type    = string
    default = "development"
}

variable "AMI_ID" {
    type    = string
    description = "the custom AMI ID you've built. it'll change"
    # default = "ami-0cd20f68b0c5d2b8a"
}

variable "AWS_REGION" {
default = "us-east-2"
}

variable "INSTANCE_TYPE" {
  default = "t2.micro"
}