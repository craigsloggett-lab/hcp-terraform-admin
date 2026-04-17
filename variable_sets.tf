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

resource "tfe_workspace_variable_set" "tfe_provider_authentication_hcp_terraform_admin" {
  variable_set_id = tfe_variable_set.tfe_provider_authentication.id
  workspace_id    = tfe_workspace.hcp_terraform_admin.id
}

resource "tfe_variable_set" "aws_provider_authentication" {
  for_each    = var.application_environments
  name        = "AWS Provider Authentication (${title(each.key)})"
  description = "The access key and secret access key IDs used to authenticate the AWS provider for the ${each.key} environment."
  global      = false
}

resource "tfe_project_variable_set" "aws_provider_authentication_dev_waypoint" {
  variable_set_id = tfe_variable_set.aws_provider_authentication["development"].id
  project_id      = tfe_project.waypoint.id
}

resource "tfe_project_variable_set" "aws_provider_authentication_dev_infrastructure" {
  variable_set_id = tfe_variable_set.aws_provider_authentication["development"].id
  project_id      = tfe_project.infrastructure.id
}

resource "tfe_workspace_variable_set" "aws_provider_authentication_dev_hcp_terraform_admin" {
  variable_set_id = tfe_variable_set.aws_provider_authentication["development"].id
  workspace_id    = tfe_workspace.hcp_terraform_admin.id
}

# This data source is used to get the values of non-sensitive variables since
# they are expected to be updated outside of Terraform and will cause drift
# otherwise.
data "tfe_variables" "aws_provider_authentication" {
  for_each        = var.application_environments
  variable_set_id = tfe_variable_set.aws_provider_authentication[each.key].id
}

resource "tfe_variable" "aws_access_key_id" {
  for_each        = var.application_environments
  key             = "AWS_ACCESS_KEY_ID"
  value           = local.aws_access_key_id_value[each.key]
  category        = "env"
  description     = "AWS Access Key ID"
  variable_set_id = tfe_variable_set.aws_provider_authentication[each.key].id
}

resource "tfe_variable" "aws_secret_access_key" {
  for_each        = var.application_environments
  key             = "AWS_SECRET_ACCESS_KEY"
  value           = "" # An empty value for a sensitive variable will never drift.
  sensitive       = true
  category        = "env"
  description     = "AWS Secret Access Key"
  variable_set_id = tfe_variable_set.aws_provider_authentication[each.key].id
}

resource "tfe_variable" "aws_session_expiration" {
  for_each        = var.application_environments
  key             = "AWS_SESSION_EXPIRATION"
  value           = local.aws_session_expiration_value[each.key]
  category        = "env"
  description     = "AWS Session Expiration"
  variable_set_id = tfe_variable_set.aws_provider_authentication[each.key].id
}

resource "tfe_variable" "aws_session_token" {
  for_each        = var.application_environments
  key             = "AWS_SESSION_TOKEN"
  value           = "" # An empty value for a sensitive variable will never drift.
  sensitive       = true
  category        = "env"
  description     = "AWS Session Token"
  variable_set_id = tfe_variable_set.aws_provider_authentication[each.key].id
}

resource "tfe_variable_set" "vault_enterprise_authentication" {
  name        = "Vault Enterprise Authentication"
  description = "Dynamic credentials used to authenticate the Vault provider via workload identity."
  global      = false
}

resource "tfe_workspace_variable_set" "vault_enterprise_authentication_vault_enterprise_admin" {
  variable_set_id = tfe_variable_set.vault_enterprise_authentication.id
  workspace_id    = tfe_workspace.vault_enterprise_admin.id
}

resource "tfe_workspace_variable_set" "vault_enterprise_authentication_consul_enterprise_deploy" {
  variable_set_id = tfe_variable_set.vault_enterprise_authentication.id
  workspace_id    = tfe_workspace.consul_enterprise_deploy.id
}

resource "tfe_workspace_variable_set" "vault_enterprise_authentication_nomad_enterprise_deploy" {
  variable_set_id = tfe_variable_set.vault_enterprise_authentication.id
  workspace_id    = tfe_workspace.nomad_enterprise_deploy.id
}

resource "tfe_variable" "vault_tfc_vault_provider_auth" {
  key             = "TFC_VAULT_PROVIDER_AUTH"
  value           = "true"
  category        = "env"
  description     = "Enable the Vault provider to authenticate using workload identity."
  variable_set_id = tfe_variable_set.vault_enterprise_authentication.id
}

#resource "tfe_variable" "vault_tfc_vault_addr" {
#  key             = "TFC_VAULT_ADDR"
#  value           = data.tfe_outputs.vault_enterprise_deploy.values.vault_url
#  category        = "env"
#  description     = "The address of the Vault instance."
#  variable_set_id = tfe_variable_set.vault_enterprise_authentication.id
#}

resource "tfe_variable" "vault_tfc_vault_auth_path" {
  key             = "TFC_VAULT_AUTH_PATH"
  value           = "jwt"
  category        = "env"
  description     = "The path of the JWT auth backend in Vault."
  variable_set_id = tfe_variable_set.vault_enterprise_authentication.id
}

resource "tfe_variable" "vault_tfc_vault_run_role" {
  key             = "TFC_VAULT_RUN_ROLE"
  value           = "terraform-admin"
  category        = "env"
  description     = "The Vault role to authenticate as via JWT."
  variable_set_id = tfe_variable_set.vault_enterprise_authentication.id
}

#resource "tfe_variable" "vault_tfc_vault_encoded_cacert" {
#  key             = "TFC_VAULT_ENCODED_CACERT"
#  value           = base64encode(data.aws_ssm_parameter.vault_ca_bundle.value)
#  category        = "env"
#  description     = "A PEM-encoded CA certificate that has been Base64 encoded."
#  variable_set_id = tfe_variable_set.vault_enterprise_authentication.id
#}

resource "tfe_variable_set" "github_provider_authentication" {
  name        = "GitHub Provider Authentication"
  description = "The token used to authenticate the GitHub provider for managing the GitHub organization."
}

resource "tfe_variable" "github_token" {
  key             = "GITHUB_TOKEN"
  value           = ""
  sensitive       = true
  category        = "env"
  description     = "Set to a Personal Access Token for a GitHub organization administrator."
  variable_set_id = tfe_variable_set.github_provider_authentication.id
}

resource "tfe_variable" "github_owner" {
  key             = "GITHUB_OWNER"
  value           = "craigsloggett-lab"
  category        = "env"
  description     = "Set to the name of the GitHub organization being managed."
  variable_set_id = tfe_variable_set.github_provider_authentication.id
}
