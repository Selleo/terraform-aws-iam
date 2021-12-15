variable "cloudfront" {
  type        = string
  description = "Cloudfront ARN"
}

variable "users" {
  type        = set(string)
  description = "Set of users names"
}
