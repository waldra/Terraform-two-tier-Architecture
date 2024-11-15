# VPC
module "vpc" {
  source             = "./modules/network"
  vpc_name           = "two-tier"
  vpc_cidr           = "10.0.0.0/16"
  private_subnets    = ["10.0.1.0/24", "10.0.2.0/24"]
  public_subnets     = ["10.0.3.0/24", "10.0.4.0/24"]
  availability_zones = ["eu-west-1a", "eu-west-1b"]
}


# Database
module "db" {
  source     = "./modules/database"
  username   = var.db_username
  password   = var.db_password
  subnet_ids = module.vpc.private_subnets_ids
  db_sg_id   = module.vpc.db_sg_id
}


# Web servers
module "ec2" {
  source             = "./modules/autoscaling"
  lt_ami_id          = "ami-0d64bb532e0502c46"
  lt_instance_type   = "t2.micro"
  lt_key_name        = "DevOps"
  asg_sg_id          = module.vpc.asg_sg_id
  public_subnets_ids = module.vpc.public_subnets_ids
  alb_tg_arn         = module.alb.alb_tg_arn
}


# Load Balancer
module "alb" {
  source            = "./modules/loadbalancer"
  vpc_id            = module.vpc.vpc_id
  alb_sg_id         = module.vpc.alb_sg_id
  public_subnet_ids = module.vpc.public_subnets_ids
}


# CloudFront
module "cloudfront" {
  source          = "./modules/cloudfront"
  certificate_arn = var.cert_arn
  alb_dns_name    = module.alb.alb_dns_name
}

# Route53
module "dns" {
  source                    = "./modules/route53"
  cloudfront_domain_name    = module.cloudfront.cloudfront_domain_name
  cloudfront_hosted_zone_id = module.cloudfront.cloudfront_hosted_zone_id
}