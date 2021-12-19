resource "aws_ecr_repository" "this" {
  name = "aws-iam-ecr"

  image_scanning_configuration {
    scan_on_push = true
  }
}

output "ECR_registry_id" {
  value = aws_ecr_repository.this.registry_id
}

output "ECR_repository_url" {
  value = aws_ecr_repository.this.repository_url
}

resource "aws_iam_user" "ecr" {
  name = "ecr"
}

resource "aws_iam_access_key" "ecr" {
  user = aws_iam_user.ecr.name
}

output "IAM_user_id" {
  value = aws_iam_access_key.ecr.id
}

output "IAM_user_secret" {
  value     = aws_iam_access_key.ecr.secret
  sensitive = true
}

module "aws_iam_ecr_policy" {
  source      = "../../modules/ecr"
  name_prefix = "aws-iam"
  ecr_arn     = aws_ecr_repository.this.arn
  users       = [aws_iam_user.ecr.name]
}
