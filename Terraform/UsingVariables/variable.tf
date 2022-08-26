variable "AWS_ACCESS_KEY" {
  type = string
  description = "This is the AWS ACCESS KEY to the root account."
}
variable "AWS_SECRET_KEY" {
  type = string
  description = "This is the AWS SECRET KEY"

}
variable "AWS_REGION" {
  type = string
  description = "This is the Region for the AWS EC2 instance."
  default = "us-east-2"

}