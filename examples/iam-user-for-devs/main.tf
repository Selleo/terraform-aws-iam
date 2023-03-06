module "secrets" {
  source = "../../modules/iam-user-for-devs"

  users = ["test@test.com"]
}