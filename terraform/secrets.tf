resource "aws_secretsmanager_secret" "credentials" {
  name = "${var.project}-${var.environment}-credentials"
}

resource "aws_secretsmanager_secret_version" "deploy_key_pair" {
  secret_id     = aws_secretsmanager_secret.credentials.id
  secret_string = jsonencode({
    user = var.instance_user
    private_key_pem = tls_private_key.deploy_key_pair.private_key_pem
    public_key_pem = tls_private_key.deploy_key_pair.public_key_pem
    public_key_openssh = tls_private_key.deploy_key_pair.public_key_openssh
  })
}
