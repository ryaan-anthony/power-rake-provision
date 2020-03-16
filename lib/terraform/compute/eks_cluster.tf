resource "aws_eks_cluster" "eks_cluster" {
  name     = "eks-cluster-${terraform.workspace}"
  role_arn = aws_iam_role.eks_role.arn

  vpc_config {
    subnet_ids = [
      aws_subnet.subnets[0].id,
      aws_subnet.subnets[1].id,
      aws_subnet.subnets[2].id,
      aws_subnet.subnets[3].id,
    ]

    security_group_ids = [
      aws_security_group.standard_policy.id
    ]
  }

  depends_on = [
    "aws_iam_role_policy_attachment.cluster_policy",
    "aws_iam_role_policy_attachment.service_policy",
    "aws_security_group.standard_policy",
    "aws_subnet.subnets"
  ]
}
