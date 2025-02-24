region             = "ap-northeast-1"
vpc_cidr           = "10.0.0.0/16"
private_subnets    = ["10.0.1.0/24", "10.0.2.0/24"]
availability_zones = ["ap-northeast-1a", "ap-northeast-1c"]
cluster_name       = "asiayo-eks-cluster"
node_instance_type = "t3.medium"
desired_size       = 3
min_size           = 1
max_size           = 5