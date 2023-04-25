locals {
  tags = {
    application   = var.application
    service       = var.service
    owner         = var.owner
    environment   = var.environment
  }
}
module "aws_s3_bucket" {
  source                = "./modules"
  region                = var.region
  bucket_name           = var.bucket_name
  tags                  = var.tags
  environment           = var.environment
  storage_class         = var.storage_class
  days_after_initiation = var.days_after_initiation
  version_status        = var.version_status
  lifecycle_status      = var.lifecycle_status
  delete_status         = var.delete_status
  cors_configuration    = var.cors_configuration
  bucket_logging        = var.bucket_logging
  max_age_seconds       = var.max_age_seconds
  encryption_configuration = var.encryption_configuration
  }
  