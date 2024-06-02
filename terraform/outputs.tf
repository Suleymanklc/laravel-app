output "vpc_id" {
  description = "The ID of the created VPC"
  value       = var.vpc_name
}

output "private_subnet_ids" {
  description = "List of IDs of private subnets"
  value       = var.private_subnet_cidrs
}

output "public_subnet_ids" {
  description = "List of IDs of public subnets"
  value       = var.public_subnet_cidrs
}
