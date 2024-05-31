variable "cluster_name" {
  description = "The name of the ECS cluster."
  type        = string
}

variable "task_definition_name" {
  description = "The name of the ECS task definition."
  type        = string
}

variable "container_name" {
  description = "The name of the container."
  type        = string
}

variable "container_image" {
  description = "The container image to use."
  type        = string
}

variable "container_port" {
  description = "The port the container will listen on."
  type        = number
}

variable "vpc_id" {
  description = "The ID of the VPC."
  type        = string
}

variable "subnet_ids" {
  description = "A list of subnet IDs."
  type        = list(string)
}
