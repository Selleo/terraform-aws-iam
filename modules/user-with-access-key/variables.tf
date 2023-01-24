variable "name" {
  type        = string
  description = "User name"
}

variable "groups" {
  type        = list(string)
  description = "List of groups to attach"
  default     = []
}
