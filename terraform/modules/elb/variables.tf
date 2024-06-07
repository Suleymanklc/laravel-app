variable "elb_name" {
  type = string
}

variable "availability_zones" {
  type = list(string)
}

variable "instance_ids" {
  type = list(string)
}
