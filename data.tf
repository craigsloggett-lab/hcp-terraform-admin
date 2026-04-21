data "tfe_outputs" "vault_enterprise_deploy" {
  organization = tfe_organization.this.name
  workspace    = tfe_workspace.vault_enterprise_deploy.name
}

# TODO: Move this to the vault-enterprise-deploy Terraform configuration
data "aws_ssm_parameter" "vault_ca_bundle" {
  name = data.tfe_outputs.vault_enterprise_deploy.values.vault_tls_ca_bundle_ssm_name
}

# This data source is used to get the values of non-sensitive variables since
# they are expected to be updated outside of Terraform and will cause drift
# otherwise.
data "tfe_variables" "aws_provider_authentication" {
  for_each        = var.application_environments
  variable_set_id = tfe_variable_set.aws_provider_authentication[each.key].id
}

# This data source is used to get the values of non-sensitive variables since
# they are expected to be updated outside of Terraform and will cause drift
# otherwise.
data "tfe_variables" "pingfederate_deploy" {
  workspace_id = tfe_workspace.pingfederate_deploy.id
}
