data "aws_iam_policy_document" "read_policy" {
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

data "aws_iam_policy_document" "write_policy" {
  statement {
    actions = [
      "secretsmanager:ListSecretVersionIds",
      "secretsmanager:PutSecretValue",
    ]

    resources = var.secrets
  }
}

resource "aws_iam_policy" "read_policy" {
  name   = "read_policy"
  policy = data.aws_iam_policy_document.read_policy.json
}

resource "aws_iam_policy_attachment" "read_attachment" {
  name       = "read_attachment"
  users      = setunion(var.read_access_users, var.full_access_users)
  policy_arn = aws_iam_policy.read_policy.arn
}

resource "aws_iam_policy" "write_policy" {
  name   = "write_policy"
  policy = data.aws_iam_policy_document.write_policy.json
}

resource "aws_iam_policy_attachment" "write_attachment" {
  name       = "write_attachment"
  users      = var.full_access_users
  policy_arn = aws_iam_policy.write_policy.arn
}
