resource "aws_security_group" "standard_policy" {
  name        = "standard policy"
  description = "Allow TLS through VPC"
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    self        = true
  }

  egress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    self        = true
  }
}
