## Usage

```tf
module "aws_iam_ecs_policy" {
  source      = "Selleo/iam/aws//modules/ecs-deploy"
  name_prefix = "aws-iam"
  service_arn = module.ecs_service.service_id
  users       = [aws_iam_user.ecs.name]
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
| [aws_iam_policy_document.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy_attachment.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy_attachment) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_name_prefix"></a> [name\_prefix](#input\_name\_prefix) | Prefix that will be prepended to resource names | `string` | n/a | yes |
| <a name="input_service_arn"></a> [service\_arn](#input\_service\_arn) | Elastic Container Service (ECS) Service ARN | `string` | n/a | yes |
| <a name="input_users"></a> [users](#input\_users) | Set of users names | `set(string)` | n/a | yes |

## Outputs

No outputs.
