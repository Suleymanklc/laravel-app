


module "policy" {
 source = "./modules/iampolicy"
  
}
module "vpc" {
  source = "./modules/vpc"
  vpc_cidr = var.vpc_cidr
  azs= var.azs
  vpc_name = var.vpc_name
  private_subnet_tags = var.private_subnet_tags
  public_subnet_tags = var.public_subnet_tags
  private_subnets =  var.private_subnets
  public_subnets = var.public_subnets
  region = var.region
}
data "aws_eks_cluster" "eks-cluster" {
  name = var.cluster_name
  depends_on = [
    module.eks
  ]
}

module "eks" {
  source = "./modules/eks"
  cluster_name = var.cluster_name
  cluster_version = var.cluster_version
  vpc_id = module.vpc.vpc_id
  public_subnets = module.vpc.public_subnets
  private_subnets = module.vpc.private_subnets
  region = var.region
  lb_ingress_policy_name = var.lb_ingress_policy_name
  account_id = var.account_id
  policy_name = module.policy.name
  user_id = var.user_id
}


module "ingress-controller" {
  source = "./modules/ingress-controller"
  cluster_name = var.cluster_name
  lb_ingress_policy_name = var.lb_ingress_policy_name
  vpc_id = module.vpc.vpc_id
  endpoint = data.aws_eks_cluster.eks-cluster.endpoint
  kubeconfig-certificate-authority-data = base64decode(data.aws_eks_cluster.eks-cluster.certificate_authority.0.data)
}
