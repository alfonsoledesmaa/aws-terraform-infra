output "vpc_id" {
  value = module.network.vpc_id
}

output "elb_dns_name" {
  description = "The DNS name of the load balancer"
  value       = module.load_balancer.elb_dns_name
}