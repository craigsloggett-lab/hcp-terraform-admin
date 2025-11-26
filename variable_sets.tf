resource "tfe_variable_set" "tfe_provider_authentication" {
  name        = "TFE Provider Authentication"
  description = "The token used to authenticate the TFE provider for managing this HCP Terraform organization."
}

resource "tfe_variable" "tfe_token" {
  key             = "TFE_TOKEN"
  value           = ""
  sensitive       = true
  category        = "env"
  description     = "Set to a Team Token for the \"owners\" team."
  variable_set_id = tfe_variable_set.tfe_provider_authentication.id
}

resource "tfe_workspace_variable_set" "hcp_terraform_admin_tfe_provider_authentication" {
  variable_set_id = tfe_variable_set.tfe_provider_authentication.id
  workspace_id    = tfe_workspace.hcp_terraform_admin.id
}

import {
  id = "varset-zg85eodKaGw4H1sD"
  to = tfe_variable_set.aws_provider_authentication_dev
}

resource "tfe_variable_set" "aws_provider_authentication_dev" {
  name        = "AWS Provider Authentication (dev)"
  description = "The access key and secret access key IDs used to authenticate the AWS provider for the development environment."
  global      = false
}

resource "tfe_variable_set" "aws_provider_authentication_prod" {
  name        = "AWS Provider Authentication (prod)"
  description = "The access key and secret access key IDs used to authenticate the AWS provider for the production environment."
  global      = false
}
