variable "AWS_ACCESS_KEY" {
  type = string
  description = "This is the AWS ACCESS KEY to the root account."
  default = "AKIA43OIJPT5MM3C532S"
}
variable "AWS_SECRET_KEY" {
  type = string
  description = "This is the AWS SECRET KEY"
  default = "Tr0eRAYHwbjOgVDa8WKbV01ug24kaBZ03RAE/Xyi"

}
variable "AWS_REGION" {
  type = string
  description = "This is the Region for the AWS EC2 instance."
  default = "us-east-2"

}

variable "Security_Group" {
  type = list
  default = ["sg-242334", "sg-2329832", "sg-23432892"]
}

variable "AMIS" {
  type = map
  default = {
    us-west-1 = "ami-007ef5e8a5e43d323"
    us-west-2 = "ami-07b8a117da8f2c473"
  }
}