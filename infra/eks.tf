module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 21.0"

  name               = var.cluster-name
  kubernetes_version = "1.33"

  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets

  endpoint_public_access       = true
  endpoint_public_access_cidrs = ["200.232.119.222/32"]
  endpoint_private_access      = true

  enable_cluster_creator_admin_permissions = true

  eks_managed_node_groups = {
    tcc = {
      ami_type       = "AL2023_x86_64_STANDARD"
      instance_types = ["t3.micro"]

      min_size     = 1
      max_size     = 10
      desired_size = 2
    }
  }
}