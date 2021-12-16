data "aws_iam_policy_document" "this" {
  statement {
    actions = [
      "s3:GetObject",
      "s3:DeleteObject",
      "s3:PutObject",
    ]

    resources = [
      "${var.bucket_arn}/*"
    ]
  }

  statement {
    actions = [
      "s3:ListBucket",
      "s3:GetBucketLocation",
    ]

    resources = [
      var.bucket_arn
    ]
  }
}

resource "aws_iam_policy" "this" {
  policy = data.aws_iam_policy_document.this.json
}

resource "aws_iam_policy_attachment" "this" {
  name       = "S3_users_read_write_policy"
  users      = var.users
  policy_arn = aws_iam_policy.this.arn
}
