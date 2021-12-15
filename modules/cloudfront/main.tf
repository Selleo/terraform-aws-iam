data "aws_iam_policy_document" "this" {
  statement {
    actions = [
      "cloudfront:CreateInvalidation",
    ]

    resources = [
      var.cloudfront
    ]
  }
}

resource "aws_iam_policy" "this" {
  policy = data.aws_iam_policy_document.this.json
}

resource "aws_iam_policy_attachment" "this" {
  name       = "cloudfront-invalidation-policy"
  policy_arn = aws_iam_policy.this.arn
  users      = var.users
}
