variable "project_name" {
  description = "The name of the project, which will be used to create the S3 bucket and deploy user. e.g. demo-website"
  type        = string
}

variable "index_file" {
  description = "The name of the error file in the S3 bucket"
  type        = string
  default     = "index.html"
}

variable "error_file" {
  description = "The name of the error file in the S3 bucket"
  type        = string
  default     = "404.html"
}
