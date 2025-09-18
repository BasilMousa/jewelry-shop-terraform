variable "elb_name" {
  description = "Name for the ELB"
  type        = string
}

variable "public_subnet_ids" {
  description = "IDs of public subnets"
  type        = list(string)
}

variable "elb_sg_id" {
  description = "Security group ID for ELB"
  type        = string
}

variable "target_group_name" {
  description = "Name for the target group"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "app_server_ids" {
  description = "IDs of app server EC2 instances"
  type        = list(string)
}
