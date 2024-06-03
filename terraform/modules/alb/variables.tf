# alb_module/variables.tf

variable "domain_name" {
  description = "The name of the ALB"
  type        = string
}
variable "name" {
  description = "The name of the ALB"
  type        = string
}

variable "security_group_id" {
  description = "The security group ID for the ALB"
  type        = string
}

variable "subnets" {
  description = "The subnets for the ALB"
  type        = list(string)
}

variable "vpc_id" {
  description = "The VPC ID for the ALB"
  type        = string
}

variable "target_group_port" {
  description = "The port for the target group"
  type        = number
}

variable "listener_http_port" {
  description = "The listener HTTP port for the ALB"
  type        = number
}

variable "listener_https_port" {
  description = "The listener HTTPS port for the ALB"
  type        = number
}

variable "certificate_arn" {
  description = "The ARN of the certificate for HTTPS listener"
  type        = string
}
