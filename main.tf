locals {
  cluster_name = "rmarliere-eks-${random_string.suffix.result}"
  # region       = terraform.workspace == "default" ? "us-east-1" : "us-west-2"
  region = "us-east-1"
}

# Random Provider

resource "random_string" "suffix" {
  length  = 8
  special = false
}

module "vpc" {
  source       = "./modules/services/vpc"
  cluster_name = local.cluster_name
  region       = local.region
}

module "eks" {
  source                   = "./modules/services/eks"
  cluster_name             = local.cluster_name
  aws_sg_node_group_one_id = module.vpc.aws_sg_node_group_one_id
  aws_sg_node_group_two_id = module.vpc.aws_sg_node_group_two_id
  vpc_id                   = module.vpc.vpc_id
  private_subnets          = module.vpc.private_subnets
}

module "webserver-cluster" {
  source                             = "./modules/services/webserver-cluster"
  cluster_endpoint                   = module.eks.cluster_endpoint
  cluster_id                         = module.eks.cluster_id
  cluster_certificate_authority_data = module.eks.certificate
}

