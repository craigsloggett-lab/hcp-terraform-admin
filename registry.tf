# Public Providers

resource "tfe_registry_provider" "hashicorp" {
  for_each     = toset(["tfe", "azurerm"])
  organization = data.tfe_organization.this.name

  registry_name = "public"
  namespace     = "hashicorp"
  name          = each.key
}

resource "tfe_registry_provider" "microsoft" {
  for_each     = toset(["fabric"])
  organization = data.tfe_organization.this.name

  registry_name = "public"
  namespace     = "microsoft"
  name          = each.key
}

# Private Modules

import {
  to = tfe_registry_module.terraform_fabric_data_engineering_onboarding
  id = "craigsloggett-lab/private/craigsloggett-lab/data-engineering-onboarding/fabric/mod-JAKXuRogdvNVXPhr"
}

resource "tfe_registry_module" "terraform_fabric_data_engineering_onboarding" {
  test_config {
    tests_enabled = true
  }

  vcs_repo {
    branch             = "main"
    display_identifier = "craigsloggett-lab/terraform-fabric-data-engineering-onboarding"
    identifier         = "craigsloggett-lab/terraform-fabric-data-engineering-onboarding"
    oauth_token_id     = data.tfe_oauth_client.github.oauth_token_id
  }
}

resource "tfe_no_code_module" "terraform_fabric_data_engineering_onboarding" {
  organization    = data.tfe_organization.this.name
  registry_module = tfe_registry_module.terraform_fabric_data_engineering_onboarding.id
}
