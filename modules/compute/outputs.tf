output "alb_dns_name" {
  value       = aws_lb.main.dns_name
  description = "Public DNS name of the ALB"
}

output "ecr_repository_url" {
  value       = aws_ecr_repository.app.repository_url
  description = "URL of the ECR repository"
}

output "ecs_tasks_sg_id" {
  value       = aws_security_group.ecs_tasks.id
  description = "Security Group ID of the ECS tasks"
}