resource "random_id" "this" {
  byte_length = 4

  prefix = "account-access-"
}


resource "aws_iam_user" "this" {
  for_each = var.users

  name = each.value
}

data "aws_iam_policy_document" "iam_devs_users" {
  statement {
    sid    = "AllowViewAccountInfo"
    effect = "Allow"
    actions = [
      "iam:GetAccountPasswordPolicy",
      "iam:GetAccountSummary"
    ]
    resources = ["*"]
  }
  statement {
    sid    = "AllowManageOwnPasswords"
    effect = "Allow"
    actions = [
      "iam:ChangePassword",
      "iam:GetUser"
    ]
    resources = ["arn:aws:iam::*:user/$${aws:username}"]
  }
  statement {
    sid    = "AllowManageOwnAccessKeys"
    effect = "Allow"
    actions = [
      "iam:CreateAccessKey",
      "iam:DeleteAccessKey",
      "iam:ListAccessKeys",
      "iam:UpdateAccessKey"
    ]
    resources = ["arn:aws:iam::*:user/$${aws:username}"]
  }
}

resource "aws_iam_group" "iam_devs_users" {
  name = random_id.this.hex
}

resource "aws_iam_group_membership" "this" {
  for_each = var.users

  name = random_id.this.hex

  users = [each.value]

  group = aws_iam_group.iam_devs_users.name
}

resource "aws_iam_group_policy_attachment" "iam_devs_users" {
  group      = aws_iam_group.iam_devs_users.name
  policy_arn = aws_iam_policy.iam_devs_users_group.arn
}

resource "aws_iam_policy" "iam_devs_users_group" {
  name   = random_id.this.hex
  policy = data.aws_iam_policy_document.iam_devs_users.json
}
