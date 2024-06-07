terraform {
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.0.1"
    }
  }
}

provider "helm" {
  kubernetes {
    host                   = var.endpoint
    cluster_ca_certificate = var.kubeconfig-certificate-authority-data
    exec {
        api_version = "client.authentication.k8s.io/v1beta1"
        command     = "aws"
        args = [
            "eks",
            "get-token",
            "--cluster-name",
            var.cluster_name
            ]
        }
    }
}

resource "helm_release" "aws-ingress-controller" {
  name       = "ingress-controller"

  repository = "https://aws.github.io/eks-charts"
  chart      = "aws-load-balancer-controller"
  create_namespace = true
  namespace = "ingress-controller"
  version = "1.4.4"

  set {
    name = "vpcId"
    value = var.vpc_id
  }

  set {
    name = "clusterName"
    value = var.cluster_name
  }

  set {
    name = "replicaCount"
    value = 1
  }
}
