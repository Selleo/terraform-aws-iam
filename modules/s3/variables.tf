variable "s3" {
  type        = string
  description = "S3 Bucket ARN"
}

variable "users" {
  type        = set(string)
  description = "Set of users names"
}
