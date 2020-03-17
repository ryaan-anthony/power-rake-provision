resource "aws_s3_bucket" "terraform_state" {
  bucket = var.bucket
  acl = "private"

  versioning {
    enabled = true
  }
}

resource "aws_s3_bucket_public_access_block" "block_access" {
  bucket = aws_s3_bucket.terraform_state.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}