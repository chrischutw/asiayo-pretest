module "vpc" {
  source            = "./modules/vpc"
}

module "eks" {
  source            = "./modules/eks"
  version           = "~> 20.31"
  cluster_name      = var.cluster_name
}
