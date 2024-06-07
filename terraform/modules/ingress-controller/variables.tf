variable "vpc_id" {
  description = "VPC id used to build the eks cluster"
  type = string
}

variable "cluster_name" {
  description = "Cluster name for the ingress controller"
  type = string
}

variable "endpoint" {
  description = "eks cluster endpoint"
}

variable "kubeconfig-certificate-authority-data" {
  description = "kubeconfig certificate authority data"
}

variable "lb_ingress_policy_name" {
  description = "ALB ingress controller policy"
}