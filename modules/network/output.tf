# VPC outputs
output "vpc_id" {
  value = aws_vpc.vpc.id
}

output "public_subnets_ids" {
  value = aws_subnet.public_subnets[*].id
}

output "private_subnets_ids" {
  value = aws_subnet.private_subnets[*].id
}


# Gateway outputs
output "igw_id" {
  value = aws_internet_gateway.igw.id
}

output "nat_gw_ids" {
  value = aws_nat_gateway.nat_gw[*].id
}


# Route table outputs
output "public_rtb_id" {
  value = aws_route_table.public_rtb.id
}

output "private_rtb_ids" {
  value = aws_route_table.private_rtb[*].id
}


# Security groups ouputs
output "alb_sg_id" {
  value = aws_security_group.alb_sg.id
}

output "asg_sg_id" {
  value = aws_security_group.asg_sg.id
}

output "db_sg_id" {
  value = aws_security_group.db_sg.id
}