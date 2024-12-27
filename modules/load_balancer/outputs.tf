output "https_listener_protocol" {
  description = "The protocol of the HTTPS listener"
  value       = aws_lb_listener.https_listener.protocol
}

output "https_listener_ssl_policy" {
  description = "The SSL policy of the HTTPS listener"
  value       = aws_lb_listener.https_listener.ssl_policy
}

output "elb_dns_name" {
  description = "The DNS name of the load balancer"
  value       = aws_lb.main_lb.dns_name
}