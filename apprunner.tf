terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "ap-northeast-1"
}

resource "aws_apprunner_service" "remix-app" {
  service_name = "remix-app"

  source_configuration {
    authentication_configuration {
      access_role_arn = aws_iam_role.app-runner-role.arn
    }
    image_repository {
      image_identifier      = "321596432058.dkr.ecr.ap-northeast-1.amazonaws.com/remix-app-distroless:latest"
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
