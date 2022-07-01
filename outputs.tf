output "website_endpoint" {
  description = "The S3 website endpoint to access the site"
  value       = aws_s3_bucket_website_configuration.this.website_endpoint
}

output "website_s3domain" {
  description = "The S3 website domain to create Route 53 alias records"
  value       = aws_s3_bucket_website_configuration.this.website_domain
}

output "deploy_bucket" {
  description = "The S3 bucket to deploy the website files"
  value       = aws_s3_bucket.this
}

output "deploy_user_creds" {
  description = "The AWS credentials for the deploy user"
  value       = aws_iam_access_key.deploy_user_key
  sensitive   = true
}
