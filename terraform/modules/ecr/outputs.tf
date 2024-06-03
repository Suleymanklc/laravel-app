# alb_module/outputs.tf

output "ecr_name" {
  description = "The ARN of the ALB"
  value       = aws_ecr_repository.ecr.name
}

