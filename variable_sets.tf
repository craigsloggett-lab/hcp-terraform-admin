# AWS Provider Credentials

resource "tfe_variable_set" "aws_provider_authentication" {
  name         = var.aws_provider_authentication_variable_set_name
  description  = "The secrets used to authenticate the AWS Provider."
  organization = data.tfe_organization.this.name
}

# Azure Provider Credentials

resource "tfe_variable_set" "azurerm" {
  name         = var.azurerm_provider_authentication_variable_set_name
  description  = "The secrets used to authenticate the Azure Provider."
  organization = data.tfe_organization.this.name
}

# Microsoft Fabric Provider Credentials

resource "tfe_variable_set" "fabric" {
  name         = var.fabric_provider_authentication_variable_set_name
  description  = "The secrets used to authenticate the Microsoft Fabric Provider."
  organization = data.tfe_organization.this.name
}
