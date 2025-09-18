variable "app_server_count" {
  description = "Number of app server EC2 instances"
  type        = number
}

variable "ec2_instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "private_subnet_ids" {
  description = "IDs of private subnets"
  type        = list(string)
}

variable "public_subnet_id" {
  description = "ID of the public subnet"
  type        = string
}

variable "ec2_sg_id" {
  description = "Security group ID for app servers"
  type        = string
}

variable "ansible_sg_id" {
  description = "Security group ID for Ansible host"
  type        = string
}

variable "key_name" {
  description = "Name of the AWS EC2 Key Pair to use for SSH access"
  type        = string
}

variable "app_server_name_prefix" {
  description = "Prefix for app server names"
  type        = string
}

variable "ansible_host_name" {
  description = "Name for the Ansible host EC2 instance"
  type        = string
}
