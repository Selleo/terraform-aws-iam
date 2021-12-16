variable "bucket_arn" {
  type        = string
  description = "S3 Bucket ARN"
}

variable "users" {
  type        = set(string)
  description = "Set of users names"
}
