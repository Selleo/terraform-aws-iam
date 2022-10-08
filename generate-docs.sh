#!/bin/sh
set -e

terraform-docs markdown modules/cloudfront-invalidation/   > modules/cloudfront-invalidation/README.md
terraform-docs markdown modules/ecr-pull-push/             > modules/ecr-pull-push/README.md
terraform-docs markdown modules/ecs-deploy/                > modules/ecs-deploy/README.md
terraform-docs markdown modules/s3-read-write/             > modules/s3-read-write/README.md
terraform-docs markdown modules/secrets-manager/           > modules/secrets-manager/README.md
terraform-docs markdown modules/ssm/                       > modules/ssm/README.md
terraform-docs markdown modules/user-with-access-key/      > modules/user-with-access-key/README.md
