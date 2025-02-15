output "eks_cluster_id" {
  value = module.eks.eks_cluster_id
}

output "eks_node_group_id" {
  value = module.eks.eks_node_group_id
}

output "vpc_id" {
  value = module.vpc.vpc_id
}

output "private_subnets" {
  value = module.vpc.private_subnets
}
