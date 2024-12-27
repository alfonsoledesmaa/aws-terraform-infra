module "network" {
  source               = "./modules/network"
  vpc_cidr             = var.vpc_cidr
  public_subnet_1_cidr = var.public_subnet_1_cidr
  public_subnet_2_cidr = var.public_subnet_2_cidr
  private_subnet_1_cidr = var.private_subnet_1_cidr
  private_subnet_2_cidr = var.private_subnet_2_cidr
  az_1                 = var.az_1
  az_2                 = var.az_2
}

module "load_balancer" {
  source              = "./modules/load_balancer"
  security_group_ids  = [module.network.security_group_id]
  subnet_ids          = [module.network.public_subnet_1_id, module.network.public_subnet_2_id]
  ssl_certificate_arn = var.ssl_certificate_arn
}

module "dns" {
  source         = "./modules/dns"
  domain_name    = var.domain_name
  elb_dns_name   = module.load_balancer.elb_dns_name
}
