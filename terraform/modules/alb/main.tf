
resource "aws_lb" "aws_lb" {
  name               = var.aws_lb_name
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.security_group_id]
  subnets            = var.subnets

  tags = {
    Name = var.aws_lb_name
  }
  depends_on = [  var.certificate_arn ]
}

resource "aws_lb_target_group" "aws_lb_target_group" {
  name        = var.aws_lb_target_group_name
  port        = var.target_group_port
  protocol    = "HTTP"
  vpc_id      = var.vpc_id
  target_type = "ip"

  health_check {
    interval            = 30
    path                = "/"
    protocol            = "HTTP"
    timeout             = 5
    healthy_threshold   = 5
    unhealthy_threshold = 2
  }

  tags = {
    Name = var.aws_lb_target_group_name
  }
  depends_on = [  var.certificate_arn ]
}

resource "aws_lb_listener" "http_listener" {
  load_balancer_arn = aws_lb.aws_lb.arn
  port              = var.listener_http_port
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.aws_lb_target_group.arn
  }
  depends_on = [  var.certificate_arn]
}

resource "aws_lb_listener" "https_listener" {
  load_balancer_arn = aws_lb.aws_lb.arn
  port              = var.listener_https_port
  protocol          = "HTTPS"

  ssl_policy        = "ELBSecurityPolicy-2016-08"
  certificate_arn   = var.certificate_arn

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.aws_lb_target_group.arn

  }
  depends_on = [  var.certificate_arn ]
  
}
resource "aws_lb_listener_certificate" "laravel_acm" {
  listener_arn    = aws_lb_listener.https_listener.arn
  certificate_arn = var.certificate_arn
}
