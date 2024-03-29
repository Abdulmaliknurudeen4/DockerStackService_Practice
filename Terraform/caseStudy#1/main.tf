module "levelup-vpc" {
    source      = "./module/vpc"

    ENVIRONMENT = var.ENVIRONMENT
    AWS_REGION  = var.AWS_REGION
}

module "levelup-webserver" {
    source      = "./webserver"

    ENVIRONMENT = var.ENVIRONMENT
    AWS_REGION  = var.AWS_REGION
    vpc_private_subnet1 = module.levelup-vpc.private_subnet1_id
    vpc_private_subnet2 = module.levelup-vpc.private_subnet2_id
    vpc_id = module.levelup-vpc.my_vpc_id
    vpc_public_subnet1 = module.levelup-vpc.public_subnet1_id
    vpc_public_subnet2 = module.levelup-vpc.public_subnet2_id

}
#Define Provider
provider "aws" {
   access_key = "xxxxxxxxxxxxxxxxxxxxxxxx"
  secret_key = "XXXXXXXXXXXXXXX"
  region = var.AWS_REGION
}

output "load_balancer_output" {
  description = "Load Balancer"
  value       = module.levelup-webserver.load_balancer_output
}
# output "associate_public_ip_address" {
#   description = module.levelup-webserver.associate_public_ip_address}