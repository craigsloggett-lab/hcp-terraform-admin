resource "tfe_registry_provider" "hashicorp" {
  for_each      = toset(["tfe"])
  organization  = data.tfe_organization.this.name
  name          = each.key
  registry_name = "public"
  namespace     = "hashicorp"
}

resource "tfe_registry_module" "terraform_tfe_bootstrap" {
  organization = data.tfe_organization.this.name

  test_config {
    tests_enabled = true
  }

  vcs_repo {
    branch             = "main"
    display_identifier = "${var.github_organization_name}/terraform-tfe-bootstrap"
    identifier         = "${var.github_organization_name}/terraform-tfe-bootstrap"
    oauth_token_id     = data.tfe_oauth_client.github.oauth_token_id
  }
}

resource "tfe_test_variable" "bootstrap_tfe_provider_authentication_tfe_token" {
  key             = "TFE_TOKEN"
  value_wo        = ""
  sensitive       = true
  category        = "env"
  description     = "Set to a Team Token for the \"owners\" team."
  organization    = data.tfe_organization.this.name
  module_name     = tfe_registry_module.terraform_tfe_bootstrap.name
  module_provider = tfe_registry_module.terraform_tfe_bootstrap.module_provider
}
