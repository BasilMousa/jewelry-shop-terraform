output "app_server_private_ips" {
  description = "Private IPs of app server EC2 instances"
  value       = [for instance in aws_instance.app_server : instance.private_ip]
}

output "ansible_host_public_ip" {
  description = "Public IP of the Ansible host EC2 instance"
  value       = aws_instance.ansible_host.public_ip
}

output "elb_dns_name" {
  description = "DNS name of the Application Load Balancer"
  value       = aws_lb.app_elb.dns_name
}
