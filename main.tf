# S3 Bucket
resource "aws_s3_bucket" "this" {
  bucket = var.project_name
}

resource "aws_s3_bucket_website_configuration" "this" {
  bucket = aws_s3_bucket.this.bucket

  index_document {
    suffix = var.index_file
  }

  error_document {
    key = var.error_file
  }
}

# Deploy User
resource "aws_iam_user" "deploy_user" {
  name = "${var.project_name}-deploy"
}

resource "aws_iam_access_key" "deploy_user_key" {
  user = aws_iam_user.deploy_user.name
}

resource "aws_iam_user_policy" "deploy_user_permissions" {
  name = "AllowS3Deploy"
  user = aws_iam_user.deploy_user.name

  policy = jsonencode({
    Version   = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "s3:ListBucketMultipartUploads",
          "s3:ListBucket",
          "s3:GetBucketLocation",
          "s3:HeadBucket",
        ]
        Resource = aws_s3_bucket.this.arn
      },
      {
        Effect = "Allow"
        Action = [
          "s3:PutObject",
          "s3:GetObjectAcl",
          "s3:GetObject",
          "s3:AbortMultipartUpload",
          "s3:DeleteObject",
          "s3:PutObjectAcl",
          "s3:ListMultipartUploadParts"
        ]
        Resource = "${aws_s3_bucket.this.arn}/*"
      }
    ]
  })
}
