


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

module "eks" {
  source = "./modules/eks"
  cluster_name = var.cluster_name
  cluster_version = var.cluster_version
  vpc_id = module.vpc.vpc_id
  public_subnets = module.vpc.public_subnets
  private_subnets = module.vpc.private_subnets
  region = var.region
  user_id = var.user_id
}
