output "cluster_id" {
  description = "EKS cluster ID"
  value       = module.eks.cluster_id
}

output "region" {
  description = "AWS region"
  value       = local.region
}

output "cluster_name" {
  description = "Kubernetes Cluster Name"
  value       = local.cluster_name
}

output "certificate" {
  description = "Certificate of cluster"
  value       = module.eks.certificate
}