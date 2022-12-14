module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "18.30.2"

  cluster_name    = var.cluster_name
  cluster_version = "1.22"

  vpc_id     = var.vpc_id
  subnet_ids = var.private_subnets

  #fix for https://github.com/terraform-aws-modules/terraform-aws-eks/issues/2258
  node_security_group_tags = {
    "kubernetes.io/cluster/${var.cluster_name}" = null
  }

  eks_managed_node_group_defaults = {
    ami_type = "AL2_x86_64"

    attach_cluster_primary_security_group = true

    # Disabling and using externally provided security groups
    create_security_group = false
  }

  eks_managed_node_groups = {
    one = {
      name = "node-group-1"

      instance_types = ["t3.small"]

      min_size     = 1
      max_size     = 3
      desired_size = 2

      vpc_security_group_ids = [
        var.aws_sg_node_group_one_id
      ]
    }

    two = {
      name = "node-group-2"

      instance_types = ["t3.medium"]

      min_size     = 1
      max_size     = 2
      desired_size = 1

      vpc_security_group_ids = [
        var.aws_sg_node_group_two_id
      ]
    }
  }
}
