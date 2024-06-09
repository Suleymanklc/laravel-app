output "eks_managed_node_groups" {
  description = "The ID of the created VPC"
  value       = module.eks.eks_managed_node_groups
}
output "cluster_security_group_id" {
  description = "The ID of the created VPC"
  value       = module.eks.cluster_security_group_id
}
