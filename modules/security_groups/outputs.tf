output "elb_sg_id" {
  description = "ID of the ELB security group"
  value       = aws_security_group.elb_sg.id
}

output "ec2_sg_id" {
  description = "ID of the EC2 security group"
  value       = aws_security_group.ec2_sg.id
}

output "ansible_sg_id" {
  description = "ID of the Ansible host security group"
  value       = aws_security_group.ansible_sg.id
}
