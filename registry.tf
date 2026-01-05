resource "tfe_registry_provider" "hashicorp" {
  for_each      = toset(["tfe", "aws", "random"])
  name          = each.key
  registry_name = "public"
  namespace     = "hashicorp"
}

#resource "tfe_registry_module" "playground" {
#  for_each = local.playground_modules
#
#  test_config {
#    tests_enabled = true
#  }
#
#  vcs_repo {
#    display_identifier = "${var.github_organization_name}/${each.key}"
#    identifier         = "${var.github_organization_name}/terraform-modules-playground"
#    branch             = "main"
#    oauth_token_id     = tfe_oauth_client.github.oauth_token_id
#    source_directory   = each.key
#  }
#}
