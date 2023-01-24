## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_iam_access_key.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_access_key) | resource |
| [aws_iam_user.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user) | resource |
| [aws_iam_user_group_membership.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user_group_membership) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_groups"></a> [groups](#input\_groups) | List of groups to attach | `list(string)` | `[]` | no |
| <a name="input_name"></a> [name](#input\_name) | User name | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_access_key_as_envs"></a> [access\_key\_as\_envs](#output\_access\_key\_as\_envs) | User access key map containing AWS\_ACCESS\_KEY\_ID and AWS\_SECRET\_ACCESS\_KEY. |
| <a name="output_arn"></a> [arn](#output\_arn) | User ARN. |
| <a name="output_key_id"></a> [key\_id](#output\_key\_id) | Access key ID. |
| <a name="output_key_secret"></a> [key\_secret](#output\_key\_secret) | Access secret access key. |
| <a name="output_name"></a> [name](#output\_name) | User name. |
