module "dev-vpc" {
  source = "../../custom_vpc"

  vpcname = "dev02-qa-vpc"
  cidr = "10.0.1.0/24"
  enable_dns_support = "true"
  enable_classiclink = "false"
  enable_classiclink_dns_support = "false"
  enable_ipv6 = "false"
  vpcenvironment = "Development-Engineering-QA"
  #custom region instead of us-east-2, it provides the VPC in us-east-1
  AWS_REGION = "us-east-1"
}