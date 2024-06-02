variable "subnets" {
  description = "The subnets to deploy the ALB into"
  type        = list(string)
}

variable "security_group" {
  description = "The security group to assign to the ALB"
  type        = string
}

variable "vpc_id" {
  description = "The VPC ID where the ALB and ECS service will be deployed"
  type        = string
}

variable "certificate_arn" {
  description = "The ARN of the ACM certificate to use for HTTPS"
  type        = string
}
