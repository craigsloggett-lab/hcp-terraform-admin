resource "tfe_registry_provider" "hashicorp" {
  for_each      = toset(["tfe"])
  name          = each.key
  registry_name = "public"
  namespace     = "hashicorp"
}

resource "tfe_registry_module" "terraform_tfe_bootstrap" {
  initial_version = "0.11.0"

  test_config {
    tests_enabled = true
  }

  vcs_repo {
    branch             = "main"
    display_identifier = "${var.github_organization_name}/terraform-tfe-bootstrap"
    identifier         = "${var.github_organization_name}/terraform-tfe-bootstrap"
    oauth_token_id     = tfe_oauth_client.github.oauth_token_id
  }
}

resource "tfe_no_code_module" "terraform_tfe_bootstrap" {
  registry_module = tfe_registry_module.terraform_tfe_bootstrap.id
}

resource "tfe_test_variable" "terraform_tfe_bootstrap_tfe_provider_authentication_tfe_token" {
  key             = "TFE_TOKEN"
  value           = "" # An empty value for a sensitive variable will never drift.
  sensitive       = true
  category        = "env"
  organization    = tfe_organization.this.name
  module_name     = tfe_registry_module.terraform_tfe_bootstrap.name
  module_provider = tfe_registry_module.terraform_tfe_bootstrap.module_provider
}
