# Kubernetes provider
# https://learn.hashicorp.com/terraform/kubernetes/provision-eks-cluster#optional-configure-terraform-kubernetes-provider

provider "kubernetes" {
  host                   = module.eks.cluster_endpoint
  cluster_ca_certificate = base64decode(module.eks.cluster_certificate_authority_data)
  exec {
    api_version = "client.authentication.k8s.io/v1beta1"
    args        = ["eks", "get-token", "--cluster-name", module.eks.cluster_id]
    command     = "aws"
  }
}


# AWS Provider

provider "aws" {
  region = local.region
}

data "aws_availability_zones" "available" {}

locals {
  cluster_name = "${terraform.workspace}-eks-${random_string.suffix.result}"
  region       = terraform.workspace == "default" ? "us-east-1" : "us-west-2"
}


# Helm Provider

provider "helm" {
  kubernetes {
    host                   = module.eks.cluster_endpoint
    cluster_ca_certificate = base64decode(module.eks.cluster_certificate_authority_data)
    exec {
      api_version = "client.authentication.k8s.io/v1beta1"
      args        = ["eks", "get-token", "--cluster-name", module.eks.cluster_id]
      command     = "aws"
    }
  }
}


# Random Provider

resource "random_string" "suffix" {
  length  = 8
  special = false
}


