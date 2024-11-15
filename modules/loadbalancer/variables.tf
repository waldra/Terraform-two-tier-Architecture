variable "alb_name" {
  description = "The name of application load balancer to create"
  type        = string
  default     = "webserver-alb"
}

variable "public_subnet_ids" {
  description = "IDs of public subnets for ALB"
  type        = list(string)
}

variable "lb_type" {
  description = "Type of load balancer to create"
  type        = string
  default     = "application"
}

variable "alb_sg_id" {
  description = "Security group of the load balacner"
  type        = string
}

variable "tg_name" {
  description = "Name of autoscaling target group"
  type        = string
  default     = "webserver-tg"
}

variable "tg_port" {
  description = "Target group port where traffic is forwarded to"
  type        = number
  default     = 80
}

variable "tg_protocol" {
  description = "Target group protocol"
  type        = string
  default     = "HTTP"
}

variable "vpc_id" {
  description = "ID of VPC"
  type        = string
}

variable "alb_hc_path" {
  description = "health path to check"
  type        = string
  default     = "/"
}

variable "alb_hc_port" {
  description = "Health check port"
  type        = number
  default = 80
}

variable "alb_hc_protocol" {
  description = "Health check portocol"
  type        = string
  default = "HTTP"
}

variable "alb_hc_interval" {
  description = "Health check portocol"
  type        = number
  default = 60
}

variable "alb_hc_timeout" {
  description = "Health check timeout"
  type        = number
  default = 30
}

variable "alb_hc_healthy_threshold" {
  description = "Health check "
  type        = number
  default = 5
}

variable "alb_hc_unhealthy_threshold" {
  description = "Health check portocol"
  type        = number
  default = 3
}
