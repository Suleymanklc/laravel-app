variable "vpc_id" {
  description = "The VPC ID where the ELB will be deployed."
  type        = string
}

variable "availability_zones" {
  description = "The list of availability zones."
  type        = list(string)
}

variable "elb_name" {
  description = "The name of the ELB."
  type        = string
}
