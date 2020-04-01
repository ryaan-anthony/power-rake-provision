locals {
  cluster_name = "eks-cluster"
  instance_types = ["t3.micro"]
  vpc_cidr = "10.0.0.0/26"
  subnets  = [
    "10.0.0.0/28",
    "10.0.0.16/28",
    "10.0.0.32/28",
    "10.0.0.48/28"
  ]
}

variable "bucket" {
  type = string
}

variable "dynamodb_table" {
  type = string
}
