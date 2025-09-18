output "elb_dns_name" {
  description = "DNS name of the Application Load Balancer"
  value       = aws_lb.app_elb.dns_name
}
