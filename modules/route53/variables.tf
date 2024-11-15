variable "hosted_zone_name" {
  description = "Name of public hosted zone"
  type        = string
  default     = "waldra.net"
}

variable "cloudfront_domain_name" {
  description = "DNS name of the load balancer"
  type        = string
}

variable "cloudfront_hosted_zone_id" {
  description = "Hosted zone ID of the load balancer"
  type        = string
}