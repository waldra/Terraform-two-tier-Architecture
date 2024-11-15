# Public hosted zone 
data "aws_route53_zone" "public_zone" {
  name         = var.hosted_zone_name
  private_zone = false
}

# Create "A" record that maps to ALB dns name
resource "aws_route53_record" "alb_dns" {
  zone_id = data.aws_route53_zone.public_zone.zone_id
  name    = "www.${data.aws_route53_zone.public_zone.name}"
  type    = "A"

  alias {
    name                   = var.cloudfront_domain_name
    zone_id                = var.cloudfront_hosted_zone_id
    evaluate_target_health = true
  }
}