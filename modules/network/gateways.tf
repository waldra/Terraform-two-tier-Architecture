# Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "igw"
  }
}

# Elastic IPs for the NAT gatewaies, one eip per NAT gateway
resource "aws_eip" "nat_gw_eip" {
  count  = length(var.private_subnets)
  domain = "vpc"

  tags = {
    Name = "eip-${count.index + 1}"
  }
}

# NAT gatewaies, each in a different public subnet
resource "aws_nat_gateway" "nat_gw" {
  allocation_id = aws_eip.nat_gw_eip[count.index].id
  subnet_id     = aws_subnet.public_subnets[count.index].id
  count         = length(var.public_subnets)

  depends_on = [aws_internet_gateway.igw]

  tags = {
    Name = "ngw-${count.index + 1}"
  }
}
