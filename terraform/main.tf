module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name               = var.vpc_name
  cidr               = var.vpc_cidr
  azs                = var.availability_zones
  private_subnets    = var.private_subnet_cidrs
  public_subnets     = var.public_subnet_cidrs
  enable_nat_gateway = var.enable_nat_gateway
  enable_vpn_gateway = var.enable_vpn_gateway
  tags               = var.vpc_tags

}

module "ecs" {
  source = "./ecs"

  cluster_name          = "laravel-ecs-cluster"
  task_family           = "ecs-task"
  task_cpu              = "256"
  task_memory           = "512"
  container_definitions = jsonencode([{
    name      = "nginx"
    image     = "nginx"
    essential = true
    portMappings = [{
      containerPort = 80
      hostPort      = 80
    }]
  }])
  service_name   = "laravel-ecs-service"
  desired_count  = 1
  subnets        = module.vpc.private_subnets
  vpc_id         = module.vpc.vpc_id
  target_group_arn = module.alb.target_group_arn
}
module "alb" {
  source = "./alb"

  name              = "laravel-alb"
  security_group_id = aws_security_group.alb_sg.id
  subnets           = module.vpc.public_subnets
  vpc_id            = module.vpc.vpc_id
  target_group_port = 80
  listener_http_port = 80
  listener_https_port = 443
  certificate_arn   = module.self_signed_cert.certificate_pem
}
module "self_signed_cert" {
  source      = "./self_signed_cert_module"
  domain_name = "example.com"
}