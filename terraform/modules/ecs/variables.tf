variable "subnets" {
  description = "The subnets to deploy the ECS service into"
  type        = list(string)
}

variable "security_group" {
  description = "The security group to assign to the ECS service"
  type        = string
}

variable "target_group_arn" {
  description = "The ARN of the target group to attach the ECS service to"
  type        = string
}
