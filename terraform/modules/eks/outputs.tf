# In your eks module outputs.tf file

output "vpc_id" {
  description = "List of instance IDs in the EKS node group"
  value       = module.vpc.vpc_id
}
