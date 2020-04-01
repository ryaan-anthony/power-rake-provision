resource "aws_eks_cluster" "eks_cluster" {
  name     = "eks-cluster"
  role_arn = aws_iam_role.eks_role.arn

  vpc_config {
    subnet_ids          = aws_subnet.subnets[*].id
    security_group_ids  = [
      aws_security_group.standard_policy.id
    ]
  }

  depends_on = [
    aws_iam_role_policy_attachment.eks_cluster_policy,
    aws_iam_role_policy_attachment.eks_service_policy,
    aws_security_group.standard_policy,
    aws_subnet.subnets
  ]
}

resource "aws_eks_node_group" "web_app_node_group" {
  cluster_name    = aws_eks_cluster.eks_cluster.name
  node_group_name = "web-app"
  node_role_arn   = aws_iam_role.ec2_role.arn
  subnet_ids      = aws_subnet.subnets[*].id
  instance_types  = local.instance_types

//  remote_access {
//    security_group_ids = [
//      aws_security_group.standard_policy.id
//    ]
//  }

  scaling_config {
    desired_size = 1
    max_size     = 1
    min_size     = 1
  }

  # Ensure that IAM Role permissions are created before and deleted after EKS Node Group handling.
  # Otherwise, EKS will not be able to properly delete EC2 Instances and Elastic Network Interfaces.
  depends_on = [
    aws_subnet.subnets,
    aws_eks_cluster.eks_cluster,
    aws_iam_role_policy_attachment.eks_worker_policy,
    aws_iam_role_policy_attachment.eks_cni_policy,
    aws_iam_role_policy_attachment.container_registry_policy,
  ]
}
