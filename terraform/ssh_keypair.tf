resource "tls_private_key" "deploy_key_pair" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "deploy" {
  public_key = tls_private_key.deploy_key_pair.public_key_openssh
}
