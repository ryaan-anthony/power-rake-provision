locals {
  region = "us-east-2"
}

output "endpoint" {
  value = aws_eks_cluster.eks_cluster.endpoint
}
