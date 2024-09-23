resource "aws_apprunner_service" "remix-app" {
  service_name = "remix-app"

  source_configuration {
    authentication_configuration {
      access_role_arn = aws_iam_role.app-runner-role.arn
    }
    image_repository {
      image_identifier      = "${aws_ecr_repository.remix-app.repository_url}:latest"
      image_repository_type = "ECR"
      image_configuration {
        port = 3000
      }
    }
    auto_deployments_enabled = true
  }

  tags = {
    Name = "remix-app"
  }
}
