variable "region" {
    type        = string
    default     = "us-east-1"
    description = "Name of the Region"
}
variable "bucket_name" {
    type        = string
    default     = "insights3bucket"
    description = "Name of the s3 bucket"
}
variable "tags" {
    type        = string
    default     = "insight"
    description = "Name of the tag"
}
variable "storage_class" {
   type        = string
   default     = "GLACIER"
   description = "type of storage class"
}
variable "days_after_initiation" {
   type        = number
   default     = 7
   description = "time for days after intiation"
}
variable "lifecycle_status" {
   type        = string
   default     = "Enabled"
   description = "lifecycle policy for S3 bucket "
}
variable "delete_status" {
   type        = string
   default     = "Enabled"
   description ="Policy for deleting old incomplete process"
}
variable "version_status" {
   type        = string
   default     = "Enabled"
   description = "Versioning of bucket"
}
variable "cors_configuration" {
   type        = bool
   default     = true
   description ="Bool variable to create cors configuration"
}
variable "max_age_seconds" {
   type        = number
   default     = "3000"
   description ="Maximum age seconds for bucket cors configuration "
}
variable "bucket_logging" {
    type       = bool
   default     = true
   description = "Bool variable for server logging"
}
variable "encryption_configuration" {
    type        = bool
    default     = true
    description = "encrypt configuration for bucket"
}
  
variable "environment" {
    type        = string
    default     = "test"
    description = "Name of the environment"
}
variable "application" {
    type        = string
    description = "Name of the application"
    default     = "aws_s3"
}

variable "service" {
    type        = string
    description = "Name of the service"
    default     = "Infrastructure layer"
}

variable "owner" {
    type        = string
    description = "Name of the owner"
    default     = "infra@insight.com"
}

