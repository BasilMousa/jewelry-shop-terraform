variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "elb_sg_name" {
  description = "Name for the ELB security group"
  type        = string
}

variable "ec2_sg_name" {
  description = "Name for the EC2 security group"
  type        = string
}

variable "ansible_sg_name" {
  description = "Name for the Ansible host security group"
  type        = string
}
