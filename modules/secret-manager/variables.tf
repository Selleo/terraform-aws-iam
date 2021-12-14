variable "secrets" {
  type        = set(string)
  description = "Set of Secret Manager Secrets ARNs"
}

variable "read_access_users" {
  type        = set(string)
  description = "Set of users names"
  default     = []
}

variable "full_access_users" {
  type        = set(string)
  description = "Set of users names"
  default     = []
}
