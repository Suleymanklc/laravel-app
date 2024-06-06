output "elb_dns_name" {
  description = "The DNS name of the ELB."
  value       = aws_elb.k8s_elb.dns_name
}

output "security_group_id" {
  description = "The security group ID for the ELB."
  value       = aws_security_group.elb_security_group.id
}
