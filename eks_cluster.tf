resource "aws_eks_cluster" "eks" {
  name     = "eks"
  role_arn = aws_iam_role.control-plane-role.arn

  vpc_config {
    subnet_ids = [aws_subnet.public-eks-subnet-1.id, aws_subnet.public-eks-subnet-2.id]
  }

  depends_on = [
    aws_iam_role_policy_attachment.AmazonEKSClusterPolicy,
    aws_iam_role_policy_attachment.AmazonEKSServicePolicy,
    aws_iam_role_policy_attachment.AmazonEKSVPCResourceController
  ]
}
