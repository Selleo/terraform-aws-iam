variable "secrets" {
  type        = set(string)
  description = "Set of Secret Manager Secrets ARNs"
}

variable "read_users" {
  type        = set(string)
  description = "Set of users names"
  default     = []
}

variable "write_users" {
  type        = set(string)
  description = "Set of users names"
  default     = []
}
