output "alb_dns" {
  value = aws_lb.app_lb.dns_name
}

output "ecr_repo_url" {
  value = aws_ecr_repository.backend_repo.repository_url
}


output "frontend_url" {
  value = aws_s3_bucket_website_configuration.frontend_website.website_endpoint
}

output "database-endpoint" {
  value = aws_db_instance.mysql.endpoint
}

output "cloudfront_url" {
  value = aws_cloudfront_distribution.frontend_cdn.domain_name
}

output "ECR_REPOSITORY" {
  description = "Amazon ECR repository name where Docker images for the backend will be pushed"
  value       = aws_ecr_repository.backend_repo.name
}

output "ECS_CLUSTER_NAME" {
  description = "Name of the ECS cluster where backend containers are running"
  value       = aws_ecs_cluster.main.name
}

output "ECS_SERVICE_NAME" {
  description = "ECS service updated during deployment"
  value       = aws_ecs_service.backend_service.name
}

output "S3_BUCKET_NAME" {
  description = "S3 bucket hosting the frontend"
  value       = aws_s3_bucket.frontend_bucket.bucket
}
