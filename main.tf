resource "aws_ecs_cluster" "this" {
  name = var.cluster_name
  setting {
    name  = "containerInsights"
    value = var.enable_container_insights ? "enabled" : "disabled"
  }
  configuration {
    execute_command_configuration {
      kms_key_id = aws_kms_key.this.arn
      logging    = "OVERRIDE"
      log_configuration {
        cloud_watch_encryption_enabled = true
        cloud_watch_log_group_name     = aws_cloudwatch_log_group.this.name
      }
    }
  }
}
resource "aws_cloudwatch_log_group" "this" {
  name = "/ecs/${var.cluster_name}"
}
resource "aws_kms_key" "this" {
  deletion_window_in_days = 30
}
resource "aws_ecs_cluster_capacity_providers" "this" {
  cluster_name       = aws_ecs_cluster.this.name
  capacity_providers = ["FARGATE"]

  default_capacity_provider_strategy {
    base              = 1
    weight            = 100
    capacity_provider = "FARGATE"
  }
}
resource "aws_ecr_repository" "this" {
  name                 = "${var.cluster_name}-ecr-repository"
  image_tag_mutability = var.ecr_repository_settings.image_tag_mutability
  force_delete         = var.ecr_repository_settings.force_delete

  image_scanning_configuration {
    scan_on_push = var.ecr_repository_settings.image_scanning_configuration
  }

  tags = {
    Name = "${var.cluster_name}-ecr"
  }
}