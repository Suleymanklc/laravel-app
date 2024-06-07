resource "aws_elb" "this" {
  name               = var.elb_name
  availability_zones = var.availability_zones
  instances          = var.instance_ids

  listener {
    instance_port     = 80
    instance_protocol = "HTTP"
    lb_port           = 80
    lb_protocol       = "HTTP"
  }

  health_check {
    target              = "HTTP:80/"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2
  }

  tags = {
    Name = var.elb_name
  }
}

output "elb_name" {
  value = aws_elb.this.name
}

output "elb_dns_name" {
  value = aws_elb.this.dns_name
}
