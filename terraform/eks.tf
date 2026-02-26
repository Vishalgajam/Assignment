module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 20.0"

  cluster_name    = "devops-eks"
  cluster_version = "1.29"

  vpc_id     = aws_vpc.main.id
  subnet_ids = aws_subnet.private[*].id

  enable_irsa = true
 cluster_endpoint_public_access = false
 cluster_endpoint_private_access = true

  # 🚀 Added to grant admin access to the EC2 role
  enable_cluster_creator_admin_permissions = true

  create_kms_key                = false
  enable_kms_key_rotation       = false
  cluster_encryption_config     = {}

  eks_managed_node_groups = {
    default = {
      instance_types = ["t3.micro"]
      capacity_type  = "ON_DEMAND"

      min_size     = 1
      max_size     = 2
      desired_size = 1
    }
  }

  tags = {
    Environment = "dev"
    Project     = "DevOps-Assignment"
  }
}
