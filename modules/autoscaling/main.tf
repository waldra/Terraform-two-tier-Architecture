# launch template configuration for autoscaling group
resource "aws_launch_template" "lt_asg" {
  name                   = var.lt_name
  image_id               = var.lt_ami_id
  instance_type          = var.lt_instance_type
  key_name               = var.lt_key_name
  vpc_security_group_ids = [var.asg_sg_id]
  user_data              = filebase64("${path.module}/install-nginx.sh")
}

# autoscaling group for the web servers
resource "aws_autoscaling_group" "asg" {
  name                = var.asg_name
  min_size            = var.asg_min
  max_size            = var.asg_max
  desired_capacity    = var.asg_des_cap
  vpc_zone_identifier = var.public_subnets_ids
  launch_template {
    id = aws_launch_template.lt_asg.id
  }

  tag {
    key                 = "Name"
    value               = var.asg_name
    propagate_at_launch = true
  }
}

# Attach the autoscaling group to the target group of the ALB
resource "aws_autoscaling_attachment" "asg_tg_attach" {
  autoscaling_group_name = aws_autoscaling_group.asg.id
  lb_target_group_arn    = var.alb_tg_arn
}
