resource "aws_ecr_repository" "remix-app" {
  name                 = "remix-app"
  image_tag_mutability = "MUTABLE"
  force_delete         = true # 最後にリソースをすべて削除するため

  image_scanning_configuration {
    scan_on_push = true
  }
}
