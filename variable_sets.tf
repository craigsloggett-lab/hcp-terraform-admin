# TFE Provider Credentials

data "tfe_variable_set" "tfe_provider_authentication" {
  name         = var.tfe_provider_authentication_variable_set_name
  organization = data.tfe_organization.this
}

# Assign the Variable Set to Projects

resource "tfe_project_variable_set" "modules_tfe_provider_authentication" {
  project_id      = tfe_project.modules.id
  variable_set_id = data.tfe_variable_set.tfe_provider_authentication.id
}

resource "tfe_project_variable_set" "data_engineering_tfe_provider_authentication" {
  project_id      = tfe_project.data_engineering.id
  variable_set_id = data.tfe_variable_set.tfe_provider_authentication.id
}

# Azure Provider Credentials

resource "tfe_variable_set" "azurerm_provider_authentication" {
  name         = var.azurerm_provider_authentication_variable_set_name
  description  = "The secrets used to authenticate the Azure Provider."
  organization = data.tfe_organization.this.name
}

# Assign the Variable Set to Projects

resource "tfe_project_variable_set" "modules_azurerm_provider_authentication" {
  project_id      = tfe_project.modules.id
  variable_set_id = tfe_variable_set.azurerm_provider_authentication.id
}

resource "tfe_project_variable_set" "data_platform_azurerm_provider_authentication" {
  project_id      = tfe_project.data_platform.id
  variable_set_id = tfe_variable_set.azurerm_provider_authentication.id
}

resource "tfe_project_variable_set" "data_engineering_azurerm_provider_authentication" {
  project_id      = tfe_project.data_engineering.id
  variable_set_id = tfe_variable_set.azurerm_provider_authentication.id
}

# Microsoft Fabric Provider Credentials

resource "tfe_variable_set" "fabric_provider_authentication" {
  name         = var.fabric_provider_authentication_variable_set_name
  description  = "The secrets used to authenticate the Microsoft Fabric Provider."
  organization = data.tfe_organization.this.name
}

# Assign the Variable Set to Projects

resource "tfe_project_variable_set" "modules_fabric_provider_authentication" {
  project_id      = tfe_project.modules.id
  variable_set_id = tfe_variable_set.fabric_provider_authentication.id
}

resource "tfe_project_variable_set" "data_platform_fabric_provider_authentication" {
  project_id      = tfe_project.data_platform.id
  variable_set_id = tfe_variable_set.fabric_provider_authentication.id
}

resource "tfe_project_variable_set" "data_engineering_fabric_provider_authentication" {
  project_id      = tfe_project.data_engineering.id
  variable_set_id = tfe_variable_set.fabric_provider_authentication.id
}

# GitHub Provider Credentials

resource "tfe_variable_set" "github_provider_authentication" {
  name         = var.github_provider_authentication_variable_set_name
  description  = "The secrets used to authenticate the GitHub Provider."
  organization = data.tfe_organization.this.name
}
