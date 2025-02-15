module "vpc" {
  source             = "./modules/vpc"
  vpc_cidr           = var.vpc_cidr
  private_subnets    = var.private_subnets
  availability_zones = var.availability_zones
}

module "eks" {
  source             = "./modules/eks"
  version            = "~> 20.31"
  cluster_name       = var.cluster_name
  node_instance_type = var.node_instance_type
  min_size           = var.min_size
  max_size           = var.max_size
  desired_size       = var.desired_size
}
 