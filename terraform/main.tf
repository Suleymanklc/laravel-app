#module "ecr" {
#
#  source = "./modules/ecr"
#  ecr_name = var.ecr_name
#  
#}

module "eks" {
  source = "./modules/eks"

}