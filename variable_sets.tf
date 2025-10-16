# Azure Provider Credentials

resource "tfe_variable_set" "azurerm_provider_authentication" {
  name         = var.azurerm_provider_authentication_variable_set_name
  description  = "The secrets used to authenticate the Azure Provider."
  organization = data.tfe_organization.this.name
}

# Microsoft Fabric Provider Credentials

resource "tfe_variable_set" "fabric_provider_authentication" {
  name         = var.fabric_provider_authentication_variable_set_name
  description  = "The secrets used to authenticate the Microsoft Fabric Provider."
  organization = data.tfe_organization.this.name
}
