# TFE Provider Authentication

resource "tfe_variable_set" "tfe_provider_authentication" {
  name        = "TFE Provider Authentication"
  description = "The token used to authenticate the TFE provider for managing this HCP Terraform organization."
}

## Variables

resource "tfe_variable" "tfe_token" {
  key             = "TFE_TOKEN"
  value           = ""
  sensitive       = true
  category        = "env"
  description     = "Set to a Team Token for the \"owners\" team."
  variable_set_id = tfe_variable_set.tfe_provider_authentication.id
}

## Scope

resource "tfe_workspace_variable_set" "tfe_provider_authentication_hcp_terraform_admin" {
  variable_set_id = tfe_variable_set.tfe_provider_authentication.id
  workspace_id    = tfe_workspace.hcp_terraform_admin.id
}

# AWS Provider Authentication

resource "tfe_variable_set" "aws_provider_authentication" {
  for_each    = var.application_environments
  name        = "AWS Provider Authentication (${title(each.key)})"
  description = "The access key and secret access key IDs used to authenticate the AWS provider for the ${each.key} environment."
  global      = false
}

## Variables

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

## Scope

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

# Vault Enterprise Authentication

resource "tfe_variable_set" "vault_enterprise_authentication" {
  name        = "Vault Enterprise Authentication"
  description = "Dynamic credentials used to authenticate the Vault provider via workload identity."
  global      = false
}

## Variables

resource "tfe_variable" "vault_tfc_vault_provider_auth" {
  key             = "TFC_VAULT_PROVIDER_AUTH"
  value           = "true"
  category        = "env"
  description     = "Enable the Vault provider to authenticate using workload identity."
  variable_set_id = tfe_variable_set.vault_enterprise_authentication.id
}

resource "tfe_variable" "vault_tfc_vault_addr" {
  key             = "TFC_VAULT_ADDR"
  value           = data.tfe_outputs.vault_enterprise_deploy.values.vault_url
  category        = "env"
  description     = "The address of the Vault instance."
  variable_set_id = tfe_variable_set.vault_enterprise_authentication.id
}

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

resource "tfe_variable" "vault_tfc_vault_encoded_cacert" {
  key             = "TFC_VAULT_ENCODED_CACERT"
  value           = base64encode(data.aws_ssm_parameter.vault_ca_bundle.value)
  category        = "env"
  description     = "A PEM-encoded CA certificate that has been Base64 encoded."
  variable_set_id = tfe_variable_set.vault_enterprise_authentication.id
}

## Scope

resource "tfe_workspace_variable_set" "vault_enterprise_authentication_consul_enterprise_deploy" {
  variable_set_id = tfe_variable_set.vault_enterprise_authentication.id
  workspace_id    = tfe_workspace.consul_enterprise_deploy.id
}

resource "tfe_workspace_variable_set" "vault_enterprise_authentication_nomad_enterprise_deploy" {
  variable_set_id = tfe_variable_set.vault_enterprise_authentication.id
  workspace_id    = tfe_workspace.nomad_enterprise_deploy.id
}

## GitHub Provider Authentication

resource "tfe_variable_set" "github_provider_authentication" {
  name        = "GitHub Provider Authentication"
  description = "The token used to authenticate the GitHub provider for managing the GitHub organization."
}

## Variables

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

# Common Infrastructure Configuration

resource "tfe_variable_set" "common_infrastructure_configuration" {
  name        = "Common Infrastructure Configuration"
  description = "Common Terraform input variables shared across workspaces in the Infrastructure project."
  global      = false
}

## Variables

resource "tfe_variable" "project_name" {
  key             = "project_name"
  value           = "lab"
  category        = "terraform"
  description     = "The name of the project."
  variable_set_id = tfe_variable_set.common_infrastructure_configuration.id
}

resource "tfe_variable" "vpc_name" {
  key             = "vpc_name"
  value           = "hashistack"
  category        = "terraform"
  description     = "The name of the VPC."
  variable_set_id = tfe_variable_set.common_infrastructure_configuration.id
}

resource "tfe_variable" "ec2_ami_name" {
  key             = "ec2_ami_name"
  value           = "hc-base-ubuntu-2404-amd64-20260420144356"
  category        = "terraform"
  description     = "The name of the EC2 AMI."
  variable_set_id = tfe_variable_set.common_infrastructure_configuration.id
}

resource "tfe_variable" "ec2_ami_owner" {
  key             = "ec2_ami_owner"
  value           = "888995627335"
  category        = "terraform"
  description     = "AWS account ID of the AMI owner."
  variable_set_id = tfe_variable_set.common_infrastructure_configuration.id
}

resource "tfe_variable" "ec2_key_pair_name" {
  key             = "ec2_key_pair_name"
  value           = "MacBook-Pro-M4"
  category        = "terraform"
  description     = "The name of the EC2 key pair."
  variable_set_id = tfe_variable_set.common_infrastructure_configuration.id
}

resource "tfe_variable" "nlb_internal" {
  key             = "nlb_internal"
  value           = "false"
  hcl             = true
  category        = "terraform"
  description     = "Whether the NLB is internal."
  variable_set_id = tfe_variable_set.common_infrastructure_configuration.id
}

resource "tfe_variable" "route53_zone_name" {
  key             = "route53_zone_name"
  value           = "craig-sloggett.sbx.hashidemos.io"
  category        = "terraform"
  description     = "The name of the Route 53 zone."
  variable_set_id = tfe_variable_set.common_infrastructure_configuration.id
}

## Scope

resource "tfe_workspace_variable_set" "common_infrastructure_configuration_vault_enterprise_deploy" {
  variable_set_id = tfe_variable_set.common_infrastructure_configuration.id
  workspace_id    = tfe_workspace.vault_enterprise_deploy.id
}

resource "tfe_workspace_variable_set" "common_infrastructure_configuration_consul_enterprise_deploy" {
  variable_set_id = tfe_variable_set.common_infrastructure_configuration.id
  workspace_id    = tfe_workspace.consul_enterprise_deploy.id
}

resource "tfe_workspace_variable_set" "common_infrastructure_configuration_nomad_enterprise_deploy" {
  variable_set_id = tfe_variable_set.common_infrastructure_configuration.id
  workspace_id    = tfe_workspace.nomad_enterprise_deploy.id
}
