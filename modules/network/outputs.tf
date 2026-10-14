output "vpc_id" {
  value       = aws_vpc.main.id
  description = "The ID of the VPC"
}

output "public_subnet_ids" {
  value       = aws_subnet.public[*].id
  description = "List of public subnet IDs"
}

output "app_subnet_ids" {
  value       = aws_subnet.app[*].id
  description = "List of private app subnet IDs"
}

output "data_subnet_ids" {
  value       = aws_subnet.data[*].id
  description = "List of private data subnet IDs"
}