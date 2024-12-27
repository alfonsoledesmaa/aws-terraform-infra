resource "aws_route53_zone" "public_zone" {
  name = var.domain_name
}

resource "aws_route53_record" "elb_cname" {
  zone_id = aws_route53_zone.public_zone.id
  name    = "www"
  type    = "CNAME"
  ttl     = 60
  records = [var.elb_dns_name]
}
