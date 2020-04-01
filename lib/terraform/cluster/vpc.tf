resource "aws_vpc" "main" {
  cidr_block        = local.vpc_cidr
}

resource "aws_subnet" "subnets" {
  count             = 4
  vpc_id            = aws_vpc.main.id
  cidr_block        = local.subnets[count.index]
  tags = {
    "kubernetes.io/cluster/${local.cluster_name}" = "shared"
  }
}
