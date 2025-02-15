# Create VPC
resource "aws_vpc" "eks_vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "eks-vpc"
  }
}

# Create Subnet
resource "aws_subnet" "eks_private_subnet" {
  count = length(var.private_subnets)

  vpc_id            = aws_vpc.eks_vpc.id
  cidr_block        = var.private_subnets[count.index]
  availability_zone = var.availability_zones[count.index]

  tags = {
    Name = "eks-private-subnet-${count.index + 1}"
  }
}

# Create NAT Gateway
resource "aws_nat_gateway" "eks_nat_gateway" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.private[0].id

  tags = {
    Name = "eks-nat-gateway"
  }
}

resource "aws_eip" "eks_nat_eip" {
  domain = "vpc"

  tags = {
    Name = "eks-nat-eip"
  }
}

# Create Route Table for Private Subnets
resource "aws_route_table" "eks_private_rt" {
  vpc_id = aws_vpc.eks_vpc.id

  tags = {
    Name = "eks-private-rt"
  }
}

# Associate Route Table with Private Subnets
resource "aws_route_table_association" "private_subnet_association" {
  count = length(var.private_subnets)

  subnet_id      = aws_subnet.private[count.index].id
  route_table_id = aws_route_table.private.id
}

resource "aws_route" "private_route" {
  route_table_id         = aws_route_table.private.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.nat.id
}