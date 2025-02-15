terraform {
  required_version = ">= 1.10.0"
  required_providers {
    aws = {
      source   = "hashicorp/aws"
      version  = "5.87.0"
    }
    kubernetes = {
      source   = "hashicorp/kubernetes"
      version  = "2.35.1"
    }
    helm = {
      source   = "hashicorp/helm"
      version  = "3.0.0-pre1"
    }
  }
}
