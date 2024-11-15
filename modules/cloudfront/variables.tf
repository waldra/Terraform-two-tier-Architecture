variable "alb_dns_name" {
  description = "The DNS name of the Application Load Balancer to use as the origin."
  type        = string
}

variable "certificate_arn" {
  description = "The domain name of the certificate"
  type        = string
}

variable "viewer_protocol_policy" {
  description = "The protocol that viewers can use to access the files."
  type        = string
  default     = "redirect-to-https"
}

variable "price_class" {
  description = "The price class for the CloudFront distribution."
  type        = string
  default     = "PriceClass_200"
}

variable "tags" {
  description = "Tags to associate with resources."
  type        = map(string)
  default     = {}
}

variable "min_ttl" {
  description = "The minimum amount of time, in seconds, that objects stay in CloudFront caches."
  type        = number
  default     = 0
}

variable "default_ttl" {
  description = "The default amount of time, in seconds, that objects stay in CloudFront caches."
  type        = number
  default     = 3600
}

variable "max_ttl" {
  description = "The maximum amount of time, in seconds, that objects stay in CloudFront caches."
  type        = number
  default     = 86400
}

variable "minimum_protocol_version" {
  description = "The minimum SSL protocol that CloudFront uses for HTTPS connections."
  type        = string
  default     = "TLSv1.2_2018"
}
