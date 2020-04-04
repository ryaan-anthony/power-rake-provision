resource "aws_instance" "application" {
  count                   = var.instance_count
  ami                     = var.instance_ami
  instance_type           = var.instance_type
  vpc_security_group_ids  = [aws_security_group.standard_policy.id]
  key_name                = aws_key_pair.deploy.key_name
  tags                    = {
    Name = "${var.project}-${var.environment}-${count.index}"
  }
}
