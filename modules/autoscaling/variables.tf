variable "lt_name" {
  description = "The name of Launch Template"
  type        = string
  default     = "webserver-lt"
}

variable "lt_ami_id" {
  description = "AMI ID for instances"
  type        = string
}

variable "lt_instance_type" {
  description = "Instance type for the EC2"
  type        = string
}

variable "lt_key_name" {
  description = "SSH key name to use for EC2"
  type        = string
}

variable "asg_name" {
  description = "Autoscaling group name"
  type        = string
  default     = "webserver-asg"
}

variable "asg_sg_id" {
  description = "Security group ID for EC2 instances"
  type        = string
}

variable "public_subnets_ids" {
  description = "Autoscaling group subnet IDs"
  type        = list(string)
}

variable "alb_tg_arn" {
  description = "The ARN of the ALB target group to attach"
  type        = string
}

variable "asg_des_cap" {
  description = "Desired number of instances in the ASG"
  type        = number
  default     = 2
}

variable "asg_max" {
  description = "Maximum number of instances in the ASG"
  type        = number
  default     = 3
}

variable "asg_min" {
  description = "Minimum number of instances in the ASG"
  type        = number
  default     = 1
}
