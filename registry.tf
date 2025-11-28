resource "tfe_registry_provider" "hashicorp" {
  for_each      = toset(["tfe"])
  name          = each.key
  registry_name = "public"
  namespace     = "hashicorp"
}

import {
  id = "craigsloggett-lab/private/craigsloggett-lab/discovery/tfe/mod-rPNWcQe36gvPmm5y"
  to = tfe_registry_module.terraform_tfe_discovery
}

resource "tfe_registry_module" "terraform_tfe_discovery" {
  initial_version = "0.12.3"

  test_config {
    tests_enabled = true
  }

  vcs_repo {
    branch             = "main"
    display_identifier = "${var.github_organization_name}/terraform-tfe-discovery"
    identifier         = "${var.github_organization_name}/terraform-tfe-discovery"
    oauth_token_id     = tfe_oauth_client.github.oauth_token_id
  }
}

resource "tfe_test_variable" "terraform_tfe_discovery_tfe_provider_authentication_tfe_token" {
  key             = "TFE_TOKEN"
  value           = "" # An empty value for a sensitive variable will never drift.
  sensitive       = true
  category        = "env"
  description     = "Set to a Team Token for the \"owners\" team."
  organization    = tfe_organization.this.name
  module_name     = tfe_registry_module.terraform_tfe_discovery.name
  module_provider = tfe_registry_module.terraform_tfe_discovery.module_provider
}
