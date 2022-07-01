<!-- BEGIN_TF_DOCS -->
# S3 Website Terraform Module

## What does it do?

Creates a S3 bucket and configures it for website hosting, and creates a IAM user to deploy files to the bucket

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.15, < 5.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 4.15, < 5.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_iam_access_key.deploy_user_key](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_access_key) | resource |
| [aws_iam_user.deploy_user](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user) | resource |
| [aws_iam_user_policy.deploy_user_permissions](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user_policy) | resource |
| [aws_s3_bucket.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket_website_configuration.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_website_configuration) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_error_file"></a> [error\_file](#input\_error\_file) | The name of the error file in the S3 bucket | `string` | `"404.html"` | no |
| <a name="input_index_file"></a> [index\_file](#input\_index\_file) | The name of the error file in the S3 bucket | `string` | `"index.html"` | no |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | The name of the project, which will be used to create the S3 bucket and deploy user. e.g. demo-website | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_deploy_bucket"></a> [deploy\_bucket](#output\_deploy\_bucket) | The S3 bucket to deploy the website files |
| <a name="output_deploy_user_creds"></a> [deploy\_user\_creds](#output\_deploy\_user\_creds) | The AWS credentials for the deploy user |
| <a name="output_website_endpoint"></a> [website\_endpoint](#output\_website\_endpoint) | The S3 website endpoint to access the site |
| <a name="output_website_s3domain"></a> [website\_s3domain](#output\_website\_s3domain) | The S3 website domain to create Route 53 alias records |

## Known Issues

- \_No support for multiple deploy users\_. There is no good reason as such to have multiple deploy users/deployment
  scripts deploying to same bucket.
<!-- END_TF_DOCS -->