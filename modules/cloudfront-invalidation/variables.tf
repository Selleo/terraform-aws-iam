variable "name_prefix" {
  type        = string
  description = "Prefix that will be prepended to resource names"
}

variable "cloudfront" {
  type        = string
  description = "Cloudfront ARN"
}

variable "users" {
  type        = set(string)
  description = "Set of users names"
}

