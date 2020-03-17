locals {
  vpc_cidr = "10.0.0.0/24"
  subnets  = [
    "10.0.0.0/26",
    "10.0.0.64/26",
    "10.0.0.128/26",
    "10.0.0.192/26"
  ]
}

variable "bucket" {
  type = string
}

variable "dynamodb_table" {
  type = string
}