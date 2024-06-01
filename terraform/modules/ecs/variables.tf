variable "vpc_id" {
  description = "The ID of the VPC"
  type        = string
}

variable "public_subnets" {
  description = "The public subnets for the ECS service"
  type        = list(string)
}

variable "private_subnets" {
  description = "The private subnets for the ECS service"
  type        = list(string)
}

variable "security_group_id" {
  description = "The security group ID for the ECS service"
  type        = string
}
