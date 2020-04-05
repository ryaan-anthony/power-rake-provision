resource "tls_private_key" "deploy_key_pair" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "deploy_key_pair" {
  public_key = tls_private_key.deploy_key_pair.public_key_openssh
}

resource "aws_secretsmanager_secret" "deploy_key_pair" {
  name = "${var.project}-${var.environment}-deploy_key_pair"
}

resource "aws_secretsmanager_secret_version" "deploy_key_pair" {
  secret_id     = aws_secretsmanager_secret.deploy_key_pair.id
  secret_string = jsonencode({
    private_key_pem = tls_private_key.deploy_key_pair.private_key_pem
    public_key_pem = tls_private_key.deploy_key_pair.public_key_pem
    public_key_openssh = tls_private_key.deploy_key_pair.public_key_openssh
  })
}
