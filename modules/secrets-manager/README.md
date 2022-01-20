## Usage

```tf
module "aws_iam_secret_manager_policy" {
  source      = "Selleo/iam/aws//modules/secret-manager"
  name_prefix = "aws-iam-secret-manager"
  secrets = [
    aws_secretsmanager_secret.secret_no_1.arn,
    aws_secretsmanager_secret.secret_no_2.arn,
  ]
  read_users  = [aws_iam_user.read_only_user.name]
  write_users = [aws_iam_user.full_access_user.name]
}
```

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 3.0 |
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 3.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_iam_policy.read_secret](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.write_secret](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy_attachment.read_secret](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy_attachment) | resource |
| [aws_iam_policy_attachment.write_secret](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy_attachment) | resource |
| [aws_iam_policy_document.read_secret](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.write_secret](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_name_prefix"></a> [name\_prefix](#input\_name\_prefix) | Prefix that will be prepended to resource names | `string` | n/a | yes |
| <a name="input_read_users"></a> [read\_users](#input\_read\_users) | Set of users names | `set(string)` | `[]` | no |
| <a name="input_secrets"></a> [secrets](#input\_secrets) | Set of Secret Manager Secrets ARNs | `set(string)` | n/a | yes |
| <a name="input_write_users"></a> [write\_users](#input\_write\_users) | Set of users names | `set(string)` | `[]` | no |

## Outputs

No outputs.
