variable "users" {
    description = "Set of user names"

    type = set(string)
    default = ["testuser"]
}