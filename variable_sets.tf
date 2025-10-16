# AWS Provider Credentials

import {
  id = "varset-oT6SAwv3yoXXptoK"
  to = tfe_variable_set.aws_provider_authentication
}

resource "tfe_variable_set" "aws_provider_authentication" {
  name         = var.aws_provider_authentication_variable_set_name
  description  = "The secrets used to authenticate the AWS Provider."
  organization = data.tfe_organization.this.name
}

# Azure Provider Credentials

import {
  id = "varset-QG9pFU1edpy7xBZA"
  to = tfe_variable_set.azurerm_provider_authentication
}

resource "tfe_variable_set" "azurerm_provider_authentication" {
  name         = var.azurerm_provider_authentication_variable_set_name
  description  = "The secrets used to authenticate the Azure Provider."
  organization = data.tfe_organization.this.name
}

# Microsoft Fabric Provider Credentials

import {
  id = "varset-4744t5m8b3w7M459"
  to = tfe_variable_set.fabric_provider_authentication
}

resource "tfe_variable_set" "fabric_provider_authentication" {
  name         = var.fabric_provider_authentication_variable_set_name
  description  = "The secrets used to authenticate the Microsoft Fabric Provider."
  organization = data.tfe_organization.this.name
}
