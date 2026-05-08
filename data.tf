data "tfe_organization_membership" "admins" {
  for_each = var.admins_team_emails
  email    = each.key
}

data "tfe_outputs" "vault_enterprise_deploy" {
  organization = tfe_organization.this.name
  workspace    = tfe_workspace.vault_enterprise_deploy.name
}

# This data source is used to get the values of non-sensitive variables since
# they are expected to be updated outside of Terraform and will cause drift
# otherwise.
data "tfe_variables" "aws_provider_authentication" {
  for_each        = var.application_environments
  variable_set_id = tfe_variable_set.aws_provider_authentication[each.key].id
}
