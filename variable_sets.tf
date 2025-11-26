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

resource "tfe_variable_set" "aws_provider_authentication" {
  for_each    = var.application_environments
  name        = "AWS Provider Authentication (${title(each.key)})"
  description = "The access key and secret access key IDs used to authenticate the AWS provider for the ${each.key} environment."
  global      = false
}

resource "tfe_variable" "aws_access_key_id" {
  for_each        = var.application_environments
  key             = "AWS_ACCESS_KEY_ID"
  value           = ""
  category        = "env"
  description     = "AWS Access Key ID"
  variable_set_id = tfe_variable_set.aws_provider_authentication[each.key].id
}

resource "tfe_variable" "aws_secret_access_key" {
  for_each        = var.application_environments
  key             = "AWS_SECRET_ACCESS_KEY"
  value           = ""
  sensitive       = true
  category        = "env"
  description     = "AWS Secret Access Key"
  variable_set_id = tfe_variable_set.aws_provider_authentication[each.key].id
}

resource "tfe_variable" "aws_session_expiration" {
  for_each        = var.application_environments
  key             = "AWS_SESSION_EXPIRATION"
  value           = ""
  category        = "env"
  description     = "AWS Session Expiration"
  variable_set_id = tfe_variable_set.aws_provider_authentication[each.key].id
}

resource "tfe_variable" "aws_session_token" {
  for_each        = var.application_environments
  key             = "AWS_SESSION_TOKEN"
  value           = ""
  sensitive       = true
  category        = "env"
  description     = "AWS Session Token"
  variable_set_id = tfe_variable_set.aws_provider_authentication[each.key].id
}
