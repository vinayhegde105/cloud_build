## Requirements

No requirements.

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_aws_s3_bucket"></a> [aws\_s3\_bucket](#module\_aws\_s3\_bucket) | ./modules | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_application"></a> [application](#input\_application) | Name of the application | `string` | `"aws_s3"` | no |
| <a name="input_bucket_logging"></a> [bucket\_logging](#input\_bucket\_logging) | n/a | `bool` | `true` | no |
| <a name="input_bucket_name"></a> [bucket\_name](#input\_bucket\_name) | Name of the s3 bucket | `string` | `"insights3bucket"` | no |
| <a name="input_cors_configuration"></a> [cors\_configuration](#input\_cors\_configuration) | n/a | `bool` | `true` | no |
| <a name="input_days_after_initiation"></a> [days\_after\_initiation](#input\_days\_after\_initiation) | time for days after intiation | `number` | `7` | no |
| <a name="input_delete_status"></a> [delete\_status](#input\_delete\_status) | n/a | `string` | `"Enabled"` | no |
| <a name="input_lifecycle_status"></a> [lifecycle\_status](#input\_lifecycle\_status) | n/a | `string` | `"Enabled"` | no |
| <a name="input_max_age_seconds"></a> [max\_age\_seconds](#input\_max\_age\_seconds) | n/a | `number` | `"3000"` | no |
| <a name="input_owner"></a> [owner](#input\_owner) | Name of the owner | `string` | `"infra@insight.com"` | no |
| <a name="input_region"></a> [region](#input\_region) | Name of the Region | `string` | `"us-east-1"` | no |
| <a name="input_service"></a> [service](#input\_service) | Name of the service | `string` | `"Infrastructure layer"` | no |
| <a name="input_storage_class"></a> [storage\_class](#input\_storage\_class) | type of storage class | `string` | `"GLACIER"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Name of the tag | `string` | `"insight"` | no |
| <a name="input_version_status"></a> [version\_status](#input\_version\_status) | n/a | `string` | `"Enabled"` | no |

## Outputs

No outputs.
