# output "cluster_security_group_id" {
#   description = "Security group ids attached to the cluster control plane"
#   value       = module.eks.cluster_security_group_id
# }

output "region" {
  description = "AWS region"
  value       = var.region
}

output "cluster_name" {
  description = "Kubernetes Cluster Name"
  value       = var.cluster_name
}

output "vpc_id" {
  description = "VPC id"
  value       = module.vpc.vpc_id
}

output "private_subnets" {
  description = "private subnets"
  value       = module.vpc.private_subnets
}

output "aws_sg_node_group_one_id" {
  description = "The ID of the security group node one"
  value       = aws_security_group.node_group_one.id
}

output "aws_sg_node_group_two_id" {
  description = "The ID of the security group node two"
  value       = aws_security_group.node_group_two.id
}