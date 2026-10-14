output "db_endpoint" {
  value       = aws_db_instance.postgres.endpoint
  description = "Connection endpoint for the RDS instance"
}

output "db_secret_arn" {
  value       = aws_db_instance.postgres.master_user_secret[0].secret_arn
  description = "ARN of the Secrets Manager secret containing DB credentials"
}