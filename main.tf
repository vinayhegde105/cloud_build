variable "bucket_name" {}
variable "Environment" {}

terraform {
  backend "s3" {
  }
}

resource "aws_s3_bucket" "first"{

  bucket = var.bucket_name

  tags = {
    Environment = var.Environment
  }

}