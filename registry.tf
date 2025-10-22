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

# Azure Provider Authentication

resource "tfe_test_variable" "terraform_fabric_data_engineering_onboarding_azure_provider_authentication_arm_client_id" {
  key             = "ARM_CLIENT_ID"
  value_wo        = ""
  sensitive       = true
  category        = "env"
  organization    = data.tfe_organization.this.name
  module_name     = tfe_registry_module.terraform_fabric_data_engineering_onboarding.name
  module_provider = tfe_registry_module.terraform_fabric_data_engineering_onboarding.module_provider
}

resource "tfe_test_variable" "terraform_fabric_data_engineering_onboarding_azure_provider_authentication_arm_client_secret" {
  key             = "ARM_CLIENT_SECRET"
  value_wo        = ""
  sensitive       = true
  category        = "env"
  organization    = data.tfe_organization.this.name
  module_name     = tfe_registry_module.terraform_fabric_data_engineering_onboarding.name
  module_provider = tfe_registry_module.terraform_fabric_data_engineering_onboarding.module_provider
}

resource "tfe_test_variable" "terraform_fabric_data_engineering_onboarding_azure_provider_authentication_arm_subscription_id" {
  key             = "ARM_SUBSCRIPTION_ID"
  value_wo        = ""
  category        = "env"
  organization    = data.tfe_organization.this.name
  module_name     = tfe_registry_module.terraform_fabric_data_engineering_onboarding.name
  module_provider = tfe_registry_module.terraform_fabric_data_engineering_onboarding.module_provider
}

resource "tfe_test_variable" "terraform_fabric_data_engineering_onboarding_azure_provider_authentication_arm_tenant_id" {
  key             = "ARM_TENANT_ID"
  value_wo        = ""
  sensitive       = true
  category        = "env"
  organization    = data.tfe_organization.this.name
  module_name     = tfe_registry_module.terraform_fabric_data_engineering_onboarding.name
  module_provider = tfe_registry_module.terraform_fabric_data_engineering_onboarding.module_provider
}

# Microsoft Fabric Provider Authentication

resource "tfe_test_variable" "terraform_fabric_data_engineering_onboarding_fabric_provider_authentication_fabric_client_id" {
  key             = "FABRIC_CLIENT_ID"
  value_wo        = ""
  sensitive       = true
  category        = "env"
  organization    = data.tfe_organization.this.name
  module_name     = tfe_registry_module.terraform_fabric_data_engineering_onboarding.name
  module_provider = tfe_registry_module.terraform_fabric_data_engineering_onboarding.module_provider
}

resource "tfe_test_variable" "terraform_fabric_data_engineering_onboarding_fabric_provider_authentication_fabric_client_secret" {
  key             = "FABRIC_CLIENT_SECRET"
  value_wo        = ""
  sensitive       = true
  category        = "env"
  organization    = data.tfe_organization.this.name
  module_name     = tfe_registry_module.terraform_fabric_data_engineering_onboarding.name
  module_provider = tfe_registry_module.terraform_fabric_data_engineering_onboarding.module_provider
}

resource "tfe_test_variable" "terraform_fabric_data_engineering_onboarding_fabric_provider_authentication_fabric_tenant_id" {
  key             = "FABRIC_TENANT_ID"
  value_wo        = ""
  sensitive       = true
  category        = "env"
  organization    = data.tfe_organization.this.name
  module_name     = tfe_registry_module.terraform_fabric_data_engineering_onboarding.name
  module_provider = tfe_registry_module.terraform_fabric_data_engineering_onboarding.module_provider
}
