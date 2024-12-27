variable "domain_name" {
  description = "The domain name for Route 53"
  type        = string
}

variable "elb_dns_name" {
  description = "The DNS name of the Elastic Load Balancer"
  type        = string
}
