# CloudFront Distribution with ALB as the Origin
resource "aws_cloudfront_distribution" "cf_distribution" {
  enabled             = true
 
  origin {
    domain_name = var.alb_dns_name
    origin_id   = var.alb_dns_name

    custom_origin_config {
      http_port              = 80
      https_port             = 443
      origin_protocol_policy = "http-only"
      origin_ssl_protocols   = ["TLSv1.2"]
    }

  }

  default_cache_behavior {
    allowed_methods  = ["GET", "HEAD", "OPTIONS", "PUT", "POST", "PATCH", "DELETE"]
    cached_methods   = ["GET", "HEAD", "OPTIONS"]
    target_origin_id = var.alb_dns_name

    forwarded_values {
      query_string = true
      headers      = []
      cookies {
        forward = "all"
      }
    }

    viewer_protocol_policy = var.viewer_protocol_policy
    default_ttl            = var.default_ttl
    max_ttl                = var.max_ttl
    min_ttl                = var.min_ttl
  }

  price_class = var.price_class

  viewer_certificate {
    acm_certificate_arn            = var.certificate_arn
    minimum_protocol_version       = var.minimum_protocol_version
    ssl_support_method             = "sni-only"
  }

  # Geo-restriction rule: List of countries to allow
  restrictions {
    geo_restriction {
      restriction_type = "whitelist"
      locations = ["AE", "SA", "EG", "KW", "QA", "OM", "BH", "JO", "LB", "IQ", "IR", "PS", "SY", "YE"]
    }
  }

  tags = var.tags
}