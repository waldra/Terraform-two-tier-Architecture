# ALB security group
resource "aws_security_group" "alb_sg" {
  name        = var.alb_sg_name
  description = "ALB security group that allows traffic from the internet"
  vpc_id      = aws_vpc.vpc.id

  # Inbound Rule: Allow HTTP access from the internet
  ingress {
    description = "Allow HTTP traffic"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Inbound Rule: Allow HTTPs access from the internet
  ingress {
    description = "Allow HTTPs traffic"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Outbound Rule: Allow all egress traffic
  egress {
    from_port   = "0"
    to_port     = "0"
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  depends_on = [aws_vpc.vpc]

  tags = {
    Name = var.alb_sg_name
  }

}


# Auto_Scaling Group security group
resource "aws_security_group" "asg_sg" {
  description = "Web tier security group that allows traffic from the ALB"
  name        = var.asg_sg_name
  vpc_id      = aws_vpc.vpc.id

  # Inbound Rule: Allow HTTP Access from ALB Security Group
  ingress {
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [aws_security_group.alb_sg.id]
  }

  # Allow SSH Access from the inetnet
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Outbound Rule: Allow all outbound traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  depends_on = [aws_security_group.alb_sg]

  tags = {
    Name = var.asg_sg_name
  }

}

# Database security group
resource "aws_security_group" "db_sg" {
  description = "Database security group that allows traffic from web tier"
  name        = var.db_sg_name
  vpc_id      = aws_vpc.vpc.id

  # Inbound Rule: Allow Access from Web Tier
  ingress {
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    security_groups = [aws_security_group.asg_sg.id]
  }

  # Outbound Rule: Allow all outbound traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = var.db_sg_name
  }

}