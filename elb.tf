
resource "aws_lb" "ALB-1" {
  name               = "${var.name}-ALB-1"
  internal           = false
  subnets            = ["${var.public_subnet_1_id}", "${var.public_subnet_2_id}"]
  security_groups    = ["${aws_security_group.allow_ssh_http.id}"]
  load_balancer_type = "application"

  tags = {
    Name = "${var.name}-ngnix-1"
  }
}

resource "aws_lb_listener" "ALB-1" {
  load_balancer_arn = aws_lb.ALB-1.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg_nginx_1.arn
  }
}
resource "aws_lb_target_group" "tg_nginx_1" {
  name     = "${var.name}-ALB-1"
  vpc_id   = var.vpc_id
  port     = 80
  protocol = "HTTP"

  health_check {
    protocol          = "HTTP"
    port              = "traffic-port"
    healthy_threshold = 3
  }
}