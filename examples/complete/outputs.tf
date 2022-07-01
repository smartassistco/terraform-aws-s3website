output "sample_website_deploy_info" {
  value = {
    bucket = module.sample_website.deploy_bucket,
    creds  = module.sample_website.deploy_user_creds
  }
  sensitive = true
}
