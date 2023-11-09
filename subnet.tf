
resource "aws_subnet" "public-eks-subnet-1" {
  vpc_id     = aws_vpc.eks-vpc.id
  cidr_block = "10.0.1.0/24"
  map_public_ip_on_launch = true
  availability_zone = "ap-northeast-2a"

  tags = {
    Name = "public-eks-subnet-1"
    "kubernetes.io/role/elb" = "1"
    "kubernetes.io/cluster/eks" = "owned"
  }
}


resource "aws_subnet" "public-eks-subnet-2" {
  vpc_id     = aws_vpc.eks-vpc.id
  cidr_block = "10.0.2.0/24"
  map_public_ip_on_launch = true
  availability_zone = "ap-northeast-2c"
  tags = {
    Name = "public-eks-subnet-2"
    "kubernetes.io/role/elb" = "1"
    "kubernetes.io/cluster/eks" = "owned"
  }
}