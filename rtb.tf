resource "aws_route_table" "eks-rtb" {
  vpc_id = aws_vpc.eks-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.eks-igw.id
  }

  tags = {
    Name = "eks-rtb"
  }
}

resource "aws_route_table_association" "rtb-association-1" {
  subnet_id      = aws_subnet.public-eks-subnet-1.id
  route_table_id = aws_route_table.eks-rtb.id
}

resource "aws_route_table_association" "rtb-association-2" {
  subnet_id      = aws_subnet.public-eks-subnet-2.id
  route_table_id = aws_route_table.eks-rtb.id
}