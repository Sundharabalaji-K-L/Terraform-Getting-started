output "aws_alb_public_dns" {
  value       = "http://${aws_lb.nginx.dns_name}"
  description = "application load balancer DNS"
}
