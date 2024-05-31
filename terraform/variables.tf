variable "region" {
  description = "The AWS region to create resources in."
  default     = "us-west-2"
}

variable "vpc_id" {
  description = "The ID of the VPC."
  type        = string
}

variable "subnet_ids" {
  description = "A list of subnet IDs."
  type        = list(string)
}

variable "cluster_name" {
  description = "The name of the ECS cluster."
  default     = "my-ecs-cluster"
}

variable "task_definition_name" {
  description = "The name of the ECS task definition."
  default     = "my-task"
}

variable "container_name" {
  description = "The name of the container."
  default     = "my-container"
}

variable "container_image" {
  description = "The container image to use."
  default     = "nginx:latest"
}

variable "container_port" {
  description = "The port the container will listen on."
  default     = 80
}

variable "secondary_region" {
  description = "The secondary AWS region to deploy resources in."
  type        = string
  default     = "us-east-1"
}
variable "region" {
  description = "The AWS region to create resources in."
  type        = string
  default     = "us-west-2"
}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC."
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidrs" {
  description = "List of CIDR blocks for public subnets."
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnet_cidrs" {
  description = "List of CIDR blocks for private subnets."
  type        = list(string)
  default     = ["10.0.3.0/24", "10.0.4.0/24"]
}