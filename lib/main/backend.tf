module "remote_state" {
  source = "github.com/ryaan-anthony/terraform-backend-module"
  bucket = var.bucket
  lock_table = var.dynamodb_table
}

terraform {
  backend "s3" {
    key = "${var.project}/terraform.tfstate"
  }
}
