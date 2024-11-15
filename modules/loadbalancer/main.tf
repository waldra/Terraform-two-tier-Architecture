# Application Load Balancer
resource "aws_lb" "alb" {
  name               = var.alb_name
  subnets            = var.public_subnet_ids
  load_balancer_type = var.lb_type
  security_groups    = [var.alb_sg_id]

  tags = {
    Name = var.alb_name
  }
}

# ALB Target Group for Auto Scaling Group
resource "aws_lb_target_group" "alb_tg" {
  name     = var.tg_name
  port     = var.tg_port
  protocol = var.tg_protocol
  vpc_id   = var.vpc_id

  # Health check for the target group
  health_check {
    path                = var.alb_hc_path
    port                = var.alb_hc_port
    protocol            = var.alb_hc_protocol
    interval            = var.alb_hc_interval
    timeout             = var.alb_hc_timeout
    healthy_threshold   = var.alb_hc_healthy_threshold
    unhealthy_threshold = var.alb_hc_unhealthy_threshold
  }
}

# HTTP Listener
resource "aws_lb_listener" "http_listener" {
  load_balancer_arn = aws_lb.alb.arn
  port              = 80
  protocol          = "HTTP"

  # Forward to target group
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.alb_tg.arn
  }
}

