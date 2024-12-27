variable "security_group_ids" {
  description = "List of security group IDs"
  type        = list(string)
}

variable "subnet_ids" {
  description = "List of subnet IDs"
  type        = list(string)
}

variable "ssl_certificate_arn" {
  description = "SSL certificate ARN for the load balancer"
  type        = string
}
