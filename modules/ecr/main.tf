data "aws_iam_policy_document" "this" {
  statement {
    actions = [
      "ecr:GetAuthorizationToken"
    ]

    resources = ["*"]
  }

  statement {
    actions = [
      "ecr:BatchCheckLayerAvailability",
      "ecr:BatchGetImage",
      "ecr:CompleteLayerUpload",
      "ecr:GetDownloadUrlForLayer",
      "ecr:InitiateLayerUpload",
      "ecr:ListImages",
      "ecr:PutImage",
      "ecr:UploadLayerPart",
    ]

    resources = [var.ecr_arn]
  }
}

resource "aws_iam_policy" "this" {
  name   = "${var.name_prefix}-ecr-pull-push"
  policy = data.aws_iam_policy_document.this.json
}

resource "aws_iam_policy_attachment" "this" {
  name       = "${var.name_prefix}-ecr-pull-push"
  users      = var.users
  policy_arn = aws_iam_policy.this.arn
}
