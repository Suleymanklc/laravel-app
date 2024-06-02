variable "cluster_name" {
  description = "The name of the ECS cluster"
  type        = string
}

variable "task_family" {
  description = "The family of the ECS task"
  type        = string
}

variable "task_cpu" {
  description = "The CPU units to allocate to the ECS task"
  type        = string
}

variable "task_memory" {
  description = "The memory (in MiB) to allocate to the ECS task"
  type        = string
}

variable "container_definitions" {
  description = "The JSON definition of the containers for the task"
  type        = string
}

variable "service_name" {
  description = "The name of the ECS service"
  type        = string
}

variable "desired_count" {
  description = "The desired number of ECS service instances"
  type        = number
}

variable "subnets" {
  description = "The subnets for the ECS service"
  type        = list(string)
}

variable "vpc_id" {
  description = "The VPC ID where the ECS service will be deployed"
  type        = string
}
