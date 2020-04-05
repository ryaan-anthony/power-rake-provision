resource "aws_instance" "application" {
  count                   = var.instance_count
  ami                     = var.instance_ami
  instance_type           = var.instance_type
  vpc_security_group_ids  = [aws_security_group.policy.id]
  key_name                = aws_key_pair.deploy_key_pair.key_name
  tags                    = {
    Name = "${var.project}-${var.environment}-${count.index}"
  }
}
