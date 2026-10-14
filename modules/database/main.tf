# 1. DB Subnet Group (restricts RDS to private data subnets)
resource "aws_db_subnet_group" "main" {
  name       = "${var.project_name}-${var.environment}-db-subnet-group"
  subnet_ids = var.data_subnet_ids

  tags = {
    Name        = "${var.project_name}-${var.environment}-db-subnet-group"
    Environment = var.environment
  }
}

# 2. Database Security Group (chained: accepts inbound traffic ONLY from ECS Task SG)
resource "aws_security_group" "db" {
  name        = "${var.project_name}-${var.environment}-db-sg"
  description = "Allow inbound PostgreSQL access from ECS tasks only"
  vpc_id      = var.vpc_id

  ingress {
    protocol        = "tcp"
    from_port       = 5432
    to_port         = 5432
    security_groups = [var.ecs_tasks_sg_id]
  }

  egress {
    protocol    = "-1"
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "${var.project_name}-${var.environment}-db-sg"
    Environment = var.environment
  }
}

# 3. RDS PostgreSQL Instance
resource "aws_db_instance" "postgres" {
  identifier                          = "${var.project_name}-${var.environment}-postgres"
  engine                              = "postgres"
  engine_version                      = "15"
  instance_class                      = "db.t4g.micro"
  allocated_storage                   = 20
  max_allocated_storage               = 100
  storage_type                        = "gp3"
  storage_encrypted                   = true
  publicly_accessible                 = false
  multi_az                            = false # Kept single-AZ for cost saving (note trade-off for prod)
  skip_final_snapshot                 = true
  db_subnet_group_name                = aws_db_subnet_group.main.name
  vpc_security_group_ids              = [aws_security_group.db.id]
  db_name                             = var.db_name
  username                            = var.db_username
  manage_master_user_password         = true  # Password auto-created in AWS Secrets Manager

  tags = {
    Name        = "${var.project_name}-${var.environment}-postgres"
    Environment = var.environment
  }
}