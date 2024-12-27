variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_1_cidr" {
  description = "CIDR block for the first public subnet"
  type        = string
  default     = "10.0.1.0/24"
}

variable "public_subnet_2_cidr" {
  description = "CIDR block for the second public subnet"
  type        = string
  default     = "10.0.2.0/24"
}

variable "private_subnet_1_cidr" {
  description = "CIDR block for the first private subnet"
  type        = string
  default     = "10.0.3.0/24"
}

variable "private_subnet_2_cidr" {
  description = "CIDR block for the second private subnet"
  type        = string
  default     = "10.0.4.0/24"
}

variable "az_1" {
  description = "Availability zone for the first public subnet"
  type        = string
  default     = "us-east-1a"
}

variable "az_2" {
  description = "Availability zone for the second public subnet"
  type        = string
  default     = "us-east-1b"
}

variable "ssl_certificate_arn" {
  description = "SSL certificate ARN for the load balancer"
  type        = string
}

variable "domain_name" {
  description = "Domain name for Route53"
  type        = string
}
