variable "cluster_name" {
  description = "EKS Cluster 名稱"
  type        = string
}

variable "node_instance_type" {
  description = "Instance type for EKS nodes"
  type        = string
}

variable "desired_size" {
  description = "Desired number of worker nodes"
  type        = number
}

variable "min_size" {
  description = "Minimum number of worker nodes"
  type        = number
}

variable "max_size" {
  description = "Maximum number of worker nodes"
  type        = number
}