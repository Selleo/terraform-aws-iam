variable "name_prefix" {
  type        = string
  description = "Prefix that will be prepended to resources names"
}

variable "ecr_arn" {
  type        = string
  description = "Elastic Container Registry Repository (ECR) ARN"
}

variable "users" {
  type        = set(string)
  description = "Set of users names"
}
