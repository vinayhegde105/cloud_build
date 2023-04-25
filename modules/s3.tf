variable "bucket_name" {}
variable "tags" {}
variable "environment" {}
variable "region" {}
variable "storage_class" {}
variable "days_after_initiation" {}
variable "lifecycle_status" {}
variable "version_status" {}
variable "delete_status" {}
variable "cors_configuration" {}
variable "bucket_logging" {}
variable "max_age_seconds" {}
variable "encryption_configuration" {}

locals {
  allowed_methods = ["GET", "PUT", "POST"]
  allowed_origines = ["https://s3-website-test.hashicorp.com"]
  allowed_headers = ["*"]
  expose_headers  = ["ETag"]
  max_age_seconds = "3000"
  deletion_window_in_days = "10"
}
resource "aws_s3_bucket" "b" {
  bucket = var.bucket_name
  force_destroy = true

  tags = {
    Name        = var.tags
    Environment = var.environment
  }
}
resource "aws_s3_bucket_acl" "example" {
  bucket = aws_s3_bucket.b.id
  acl    = "private"
}

resource "aws_s3_bucket_logging" "example" {
  count = var.bucket_logging ? 1:0
  bucket = aws_s3_bucket.b.id

  target_bucket = aws_s3_bucket.b.id
  target_prefix = "log/"
}

resource "aws_s3_bucket_versioning" "versioning_example" {
  bucket = aws_s3_bucket.b.id
  versioning_configuration {
    status = var.version_status 
  }
}

resource "aws_s3_bucket_lifecycle_configuration" "static" {
  bucket = aws_s3_bucket.b.id

  rule {
    id     = "Keep previous version 30 days, then in Glacier another 60"
    status = var.lifecycle_status

    filter {
      prefix = ""
    }

    noncurrent_version_transition {
      noncurrent_days = 30
      storage_class   = var.storage_class
    }

    noncurrent_version_expiration {
      noncurrent_days = 90
    }
  }

  rule {
    id     = "Delete old incomplete multi-part uploads"
    status = var.delete_status

    filter {
      prefix = ""
    }

    abort_incomplete_multipart_upload {
      days_after_initiation = var.days_after_initiation
    }
  }
}
resource "aws_s3_bucket_cors_configuration" "example" {
  count = var.cors_configuration ? 1:0
  bucket = aws_s3_bucket.b.id
  
  cors_rule {
    allowed_headers = local.allowed_headers
    allowed_methods = local.allowed_methods
    allowed_origins = local.allowed_origines
    expose_headers  = local.expose_headers
    max_age_seconds = var.max_age_seconds
  }
 
}
resource "aws_kms_key" "mykey" {
  description             = "This key is used to encrypt bucket objects"
  deletion_window_in_days = local.deletion_window_in_days
}

resource "aws_s3_bucket_server_side_encryption_configuration" "example" {
  count = var.encryption_configuration ? 1:0
  bucket = aws_s3_bucket.b.id

  rule {
    apply_server_side_encryption_by_default {
      kms_master_key_id = aws_kms_key.mykey.arn
      sse_algorithm     = "aws:kms"
    }
  }
}
