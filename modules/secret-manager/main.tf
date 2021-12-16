data "aws_iam_policy_document" "read_secret" {
  statement {
    actions = [
      "secretsmanager:ListSecrets"
    ]

    resources = ["*"]
  }

  statement {
    actions = [
      "secretsmanager:DescribeSecret",
      "secretsmanager:GetSecretValue",
    ]

    resources = var.secrets
  }
}

data "aws_iam_policy_document" "write_secret" {
  statement {
    actions = [
      "secretsmanager:ListSecretVersionIds",
      "secretsmanager:PutSecretValue",
    ]

    resources = var.secrets
  }
}

resource "aws_iam_policy" "read_secret" {
  name   = "read_secret"
  policy = data.aws_iam_policy_document.read_secret.json
}

resource "aws_iam_policy_attachment" "read_secret" {
  name       = "read_secret"
  users      = setunion(var.read_users, var.write_users)
  policy_arn = aws_iam_policy.read_secret.arn
}

resource "aws_iam_policy" "write_secret" {
  name   = "write_secret"
  policy = data.aws_iam_policy_document.write_secret.json
}

resource "aws_iam_policy_attachment" "write_secret" {
  name       = "write_secret"
  users      = var.write_users
  policy_arn = aws_iam_policy.write_secret.arn
}
