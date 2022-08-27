data "aws_ip_ranges" "us_east_ip_range" {
  regions = ["us-east-1", "us-east-2"]
  services = [ "ec2" ]
}
resource "aws_security_group" "sg-custom_us_east1" {
  ingress {
    cidr_blocks = data.aws_ip_ranges.us_east_ip_range.cidr_blocks[4]
    description = "value"
    from_port = "443"
    protocol = "TCP"
    self = false
    to_port = 443
  }

  tags = {
    CreateDate = data.aws_ip_ranges.us_east_ip_range.create_date
    SyncToken = data.aws_ip_ranges.us_east_ip_range.sync_token
  }
}