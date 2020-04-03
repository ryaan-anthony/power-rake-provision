module "remote_state" {
  source = "github.com/ryaan-anthony/terraform-backend-module"
  bucket = var.bucket
  lock_table = var.dynamodb_table
}

variable "bucket" {
  type = string
}

variable "dynamodb_table" {
  type = string
}
