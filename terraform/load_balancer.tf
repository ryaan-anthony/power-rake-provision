resource "aws_lb" "load_balancer" {
  name               = "${var.project}-${var.environment}"
  security_groups    = [aws_security_group.standard_policy.id]
  subnets            = data.aws_subnet_ids.selected.ids
}

resource "aws_lb_listener" "redirect_insecure" {
  load_balancer_arn = aws_lb.load_balancer.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type = "redirect"

    redirect {
      port        = "443"
      protocol    = "HTTPS"
      status_code = "HTTP_301"
    }
  }
}

resource "aws_lb_listener" "forward_secure" {
  load_balancer_arn = aws_lb.load_balancer.arn
  port              = "443"
  protocol          = "HTTPS"
  certificate_arn   = var.certificate_arn

  default_action {
    target_group_arn = aws_lb_target_group.https_group.arn
    type             = "forward"
  }
}

resource "aws_lb_target_group" "https_group" {
  port     = 443
  protocol = "HTTP"
  vpc_id   = data.aws_vpc.selected.id
}

resource "aws_lb_target_group_attachment" "https_group_attachment" {
  count            = var.instance_count
  target_group_arn = aws_lb_target_group.https_group.arn
  target_id        = aws_instance.application[count.index].id
  port             = 443
}
