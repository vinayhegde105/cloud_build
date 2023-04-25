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
variable "encryption_configuration" {
    type        = bool
    default     = true
    description = "encrypt configuration for bucket"
}
variable "bucket_logging" {
    type       = bool
   default     = true
   description = "Bool variable for server logging"
}
