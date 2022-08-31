#Create AWs S3 bucket
resource "aws_s3_bucket" "levelup_s3bucket" {
  bucket = "levelup_s3bucket141_7872"
  acl = "private"

  tags = {
    Name = "levelup_s3bucket141_7872"
  }
}