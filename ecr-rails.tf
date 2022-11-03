resource "aws_ecr_repository" "railsapp" {
  name                 = "railsapp"
  image_tag_mutability = "MUTABLE"
  force_delete = true

  image_scanning_configuration {
    scan_on_push = true
  }
}