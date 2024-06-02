# ecs_module/outputs.tf

output "ecs_cluster_id" {
  description = "The ID of the ECS cluster"
  value       = aws_ecs_cluster.ecs_cluster.id
}

output "ecs_service_id" {
  description = "The ID of the ECS service"
  value       = aws_ecs_service.ecs_service.id
}

output "ecs_task_definition_arn" {
  description = "The ARN of the ECS task definition"
  value       = aws_ecs_task_definition.ecs_task.arn
}
