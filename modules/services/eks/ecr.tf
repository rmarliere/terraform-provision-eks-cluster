resource "aws_ecr_repository" "springpetclinic" {
  depends_on           = [module.eks]
  name                 = "springpetclinic"
  image_tag_mutability = "MUTABLE"
  force_delete         = true

  image_scanning_configuration {
    scan_on_push = true
  }
}