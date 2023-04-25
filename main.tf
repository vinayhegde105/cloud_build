module "aws_s3_bucket" {
  source                = "./modules"
  region                = var.region
  bucket_name           = var.bucket_name
  tags                  = var.tags
  version_status        = var.version_status
  cors_configuration    = var.cors_configuration
  encryption_configuration = var.encryption_configuration
  bucket_logging           = var.bucket_logging
  }
  